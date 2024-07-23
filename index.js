const express =require('express')
const mysql= require('mysql')
const bcrypt=require('bcrypt')
const sess= require('express-session')
const path=require('path')
const { error } = require('console')
const dbconn=mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'cleaningdb'
})
const app = express()
app.use(express.urlencoded({extended:true}))
app.use(express.static('public'));
app.use(sess({
    secret:'your encryptionkey',
    resave:false,
    saveUninitialized:true,
    Cookie: {secure:false}
}))
app.use((req,res,next)=>{
    if(req.session && req.session.user){
        res.locals.user=req.session.user
       
 }
 next()
   
})
app.get('/',(req,res)=>{
    res.render('home.ejs')
})
app.get('/signup',(req,res)=>{
    res.render('signup.ejs')
})
app.get('/signin',(req,res)=>{
    res.render('signin.ejs')
})
app.post('/signin',(req,res)=>{
    dbconn.query(`SELECT * FROM customers WHERE email ="${req.body.email}"`, (error,customer)=>{
        if(error){
            console.log(error);
            res.status(500).send('Server Error')
        }else{
            console.log(customer);
            if (customer.length==0){
                res.render('signin.ejs',{errorMessage:"Email not registered. Sign Up"})
            }else{
                let passwordMatch=bcrypt.compareSync(req.body.password,customer[0].password)
                console.log(passwordMatch);
                if(passwordMatch){
                    //initiate a session
                    req.session.user= customer[0]
                    res.redirect('/')
                }else{
                    res.render('signin.ejs',{errorMessage:"Password incorrect."})
                } }

        }
    })
})
app.post('/signup',(req,res)=>{
    console.log(req.body);
    dbconn.query(`SELECT email FROM customers WHERE email ="${req.body.email}"` , (err,result)=>{
        if(err){
            res.status(500).send('Server Error')}
            else{
                if (result.length>0){
                    //email found
                    res.render('signup.ejs',{errorMessage:"Email already in use. SignUp"})
                }else{
                    //email not found
                    const hashedPassword = bcrypt.hashSync(req.body.password,5);
                    //now store the data
                    dbconn.query(`INSERT INTO customers(first_name,last_name,address,phone,email,password)VALUES("${req.body.first_name}","${req.body. last_name}","${req.body.address}","${req.body.phone}","${req.body.email}","${hashedPassword}")`,(error)=>{
                        if (error){
                            res.status(500).send('server error')
                        } else{
                            res.redirect('/signin')
                        }
                   })
                 }
                }
            })
   
})
app.get('/logout',(req,res)=>{
    req.session.destroy(err=>{
        if(err){
            res.status(500).send('server error')}
            else{ 
                res.redirect('/')}
    });
   
})
app.get("/services",(req,res)=>{
    res.render("services.ejs")

})

    


app.get("/about",(req,res)=>{
    res.render("about.ejs")
})
app.get("/contact",(req,res)=>{
    res.render("contact.ejs")
})

app.listen(3000,()=>console.log('app is listening on port 3000'))