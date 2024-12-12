const express = require('express');
const axios = require('axios');
const app = express();


const consumerKey = process.env.CONSUMER_KEY;
const consumerSecret = process.env.CONSUMER_SECRET;
const shortcode = "YOUR_SHORTCODE";  // M-Pesa shortcode
const passkey = "YOUR_PASSKEY";      // M-Pesa passkey

// Function to get an access token
async function getAccessToken() {
  const auth = Buffer.from(`${consumerKey}:${consumerSecret}`).toString('base64');
  const response = await axios.get(
    'https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials',
    { headers: { Authorization: `Basic ${auth}` } }
  );
  return response.data.access_token;
}

// Route to initiate M-Pesa payment
app.post('/mpesa/pay', async (req, res) => {
  const token = await getAccessToken();
  const phoneNumber = req.body.phoneNumber;  // This will come from frontend input
  const amount = req.body.amount || 1;       // Define payment amount

  const timestamp = new Date().toISOString().replace(/[-T:.Z]/g, '').slice(0, 14);
  const password = Buffer.from(`${shortcode}${passkey}${timestamp}`).toString('base64');

  const paymentRequest = {
    BusinessShortCode: shortcode,
    Password: password,
    Timestamp: timestamp,
    TransactionType: "CustomerPayBillOnline",
    Amount: amount,
    PartyA: phoneNumber,
    PartyB: shortcode,
    PhoneNumber: phoneNumber,
    CallBackURL: "https://yourdomain.com/callback",  // Set up a callback endpoint
    AccountReference: "YourReference",
    TransactionDesc: "Payment for services"
  };

  try {
    const paymentResponse = await axios.post(
      'https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest',
      paymentRequest,
      { headers: { Authorization: `Bearer ${token}` } }
    );
    res.json(paymentResponse.data);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Payment initiation failed', error });
  }
});
var unirest = require("unirest");
        var req = unirest("GET", "https://sandbox.safaricom.co.ke/oauth/v1/generate");
    
        req.query({
          "grant_type": "client_credentials"
        });
    
        req.headers({
         "Authorization": "Basic SWZPREdqdkdYM0FjWkFTcTdSa1RWZ2FTSklNY001RGQ6WUp4ZVcxMTZaV0dGNFIzaA=="
        });
    
        req.end(res => {
         if (res.error) throw new Error(res.error);
         console.log(res.body);
        });

app.listen(3000, () => console.log('Server running on port 3000'));

