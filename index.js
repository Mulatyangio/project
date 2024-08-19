const express =require('express')
const mysql= require('mysql')
const bcrypt=require('bcrypt')
const sess= require('express-session')
const path=require('path')
const { log } = require('console')
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
    const privateRoutes=['/profile','/order']
    const adminRoutes=['/update','/admprofile', "/adminprofile"]
    if(req.session && req.session.user){
        res.locals.user=req.session.user       
        
        if(!req.session.user.email.includes("uwezo.co.ke")  && adminRoutes.includes(req.path) ){
            res.status(401).send('unauthorized access.Only admins can access this route')
            
        }else{
            next()
        }
       

    }else if(privateRoutes.includes(req.path)|| adminRoutes.includes(req.path)){
        res.status(401).send('unauthorized access.Log in first')
    }else{ next()}

   
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
                res.render('signin.ejs',{errorMessage:"Email not registered. Sign Up?"})
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
app.get('/admin',(req,res)=>{
    res.render('admin.ejs')

})
app.post('/admin',(req,res)=>{
    dbconn.query(`SELECT * FROM admins WHERE email ="${req.body.email}"`, (error,result)=>{
        if(error){
            console.log(error);
            res.status(500).send('Server Error') 
            
        }else{
            console.log(result);
            if(result.length>0){
                res.render('admin.ejs',{errorMessage:"email already exists. sign in?"})
            }else{
               const hashedPassword=bcrypt.hashSync(req.body.password_hash,6 )
                dbconn.query(`INSERT INTO  admins (username,email,password_hash,role) VALUES("${req.body.username}","${req.body.email}","${hashedPassword}","${req.body.role}")`,(err)=>{
                    if(err){
                        console.log(err);
                        
                        res.status(500).send("Server Error")
                    }else{
                        req.session.user= result[0]
                        res.redirect("/admprofile")
                    }
                })
            }
                
        }
    })
})
app.get('/adminsign',(req,res)=>{
    res.render('signadm.ejs')
})
app.post('/adminsign',(req,res)=>{
    dbconn.query(`SELECT * FROM admins WHERE email ="${req.body.email}"`, (err,result)=>
    {
        if(err){
            console.log(err);
            res.status(500).send('Server Error')
        }else{
            console.log(result);
            if(result.length>0){
                const hashedPassword=bcrypt.compareSync(req.body.password_hash,result[0].password_hash)
                if(hashedPassword){
                    req.session.user= result[0]
                    res.redirect('/adminprofile')
                        }else{
                            res.render('signadm.ejs',{errorMessage:"Invalid Password"})
                            }
                            }
        }
    }
)})
app.get('/adminprofile',(req,res)=>{
    if(req.session.user){
        res.render('admprofile.ejs',{username:req.session.user.username,email:req.session.user.email,
            role:req.session.user.role})
            }else{
                res.redirect('/adminsign')
                }
})
app.post('/signup',(req,res)=>{
    console.log(req.body);
    dbconn.query(`SELECT email FROM customers WHERE email ="${req.body.email}"` , (err,result)=>{
        if(err){
            res.status(500).send('Server Error')}
            else{
                if (result.length>0){
                    //email found
                    res.render('signup.ejs',{errorMessage:"Email already in use. Sign In?"})
                }else{
                    //email not found
                    const hashedPassword = bcrypt.hashSync(req.body.password,5
                    );
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
app.get('/records',(req,res)=>{
    res.render('complete.ejs')
})
app.post('/order',(req,res)=>{
                    dbconn.query(`INSERT INTO bookings(customer_id,employee_id,name,price,feedback) VALUES(${req.session.user.customer_id},1,'${req.body.name}','${req.body.price}','${req.body.feedback}')`,(err,result)=>{
                        if(err){
                            console.log(err);
                            res.status(500).send('Server Error')
                        }else{
                            res.redirect('/profile?message')
                            
                        }
                    }) 
            }
    )
   

app.get('/logout',(req,res)=>{
    req.session.destroy(err=>{
        if(err){
            res.status(500).send('server error')}
            else{ 
                res.redirect('/')}
    })  ;
   
})
app.get("/services",(req,res)=>{
    res.render("services.ejs")

})
app.get('/admprofile',(req,res)=>{
    res.render('admprofile.ejs')
})
    


app.get("/about",(req,res)=>{
    res.render("about.ejs")
})
app.get("/contact",(req,res)=>{
    res.render("contact.ejs")
})
app.get('/pricing',(req,res)=>{
    res.render('pricing.ejs')
   
})
app.get('/profile',(req,res)=>{
    dbconn.query(`SELECT * FROM bookings JOIN employees ON bookings.employee_id=employees.employee_id WHERE customer_id = ${req.session.user.customer_id}`,(err,result)=>{
        if(err){
            console.log(err);
            res.status(500).send('Server Error')
        }else if(req.session.user){
            console.log(result);
            
            res.render('profile.ejs',{user:req.session.user,bookings: result })
            }else{
                res.redirect('/signin')
                }
    } )
   
})
app.get('/payment',(req,res)=>{
    res.render('payment.ejs')
})
app.get('/FAQ',(req,res)=>{
    res.render('FAQs.ejs')
})
app.get('/update',(req,res)=>{
    res.render('update.ejs')
})
app.listen(3000,()=>console.log('app is listening on port 3000'))