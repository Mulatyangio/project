   dbconn.query(`INSERT INTO customers (first_name,last_name,email,phone,address,password) VALUES("${req.body.first_name}","${req.body.last_name}","${req.body.email}","${req.body.phone}","${req.body.address}","${req.body.password}")`)
    res.redirect('/')
    <form action="" class="hero-form">
              <input type="email" name="email_address" placeholder="Enter Your Email" aria-label="Enter Your Email"
                required class="input-field">

   <button type="submit" class="btn btn-primary">Sign up today</button>
   </form>
   <div class="container">

          <div class="app-content">

            <h2 class="h2 section-title">Download Mobile App To Stay Connected</h2>

            <p class="section-text">
              Techx Projects gives you the added advantage of several other Techx apps and third party apps through
              seamless
              integrations.
            </p>

            <div class="btn-group">

              <a href="#" class="btn btn-primary">
                <img src="./assets/images/play-store.svg" width="30" height="31" loading="lazy" alt="play store icon">

                <span class="span">
                  GET IT ON
                  <strong class="strong">Google Play</strong>
                </span>
              </a>

              <a href="#" class="btn btn-secondary">
                <img src="./assets/images/apple-store.svg" width="30" height="31" loading="lazy" alt="apple store icon">

                <span class="span">
                  GET IT ON
                  <strong class="strong">Apple Store</strong>
                </span>
              </a>

            </div>

          </div>

          <figure class="app-banner">
            <img src="./assets/images/app-banner.png" width="748" height="536" loading="lazy" alt="app screenshot"
              class="w-100">
          </figure>

        </div>
         <ul class="hero-list">

              <li class="hero-item">
                <img src="/images/carpet.jpg" width="16" height="16" loading="lazy" alt="Checkmark icon">

                <span class="span">washing carpets</span>
              </li>

              <li class="hero-item">
                <img src="./assets/images/check-circle.svg" width="16" height="16" loading="lazy" alt="Checkmark icon">

                <span class="span">Cleaning of Sofasets!!!!</span>
              </li>

              <li class="hero-item">
                <img src="./assets/images/check-circle.svg" width="16" height="16" loading="lazy" alt="Checkmark icon">

                <span class="span">Thorough House Cleaning</span>
              </li>

              <li class="hero-item">
                <img src="./assets/images/check-circle.svg" width="16" height="16" loading="lazy" alt="Checkmark icon">

                <span class="span"></span>
              </li>

              <li class="hero-item">
                <img src="./assets/images/check-circle.svg" width="16" height="16" loading="lazy" alt="Checkmark icon">

                <span class="span">Cleaning Offices!!!</span>
              </li>

            </ul>
            .header .btn {
    display: none;
  }
  
  .header {
    background-color: var(--white-1);
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    padding-block: -2px;
    z-index: 4;
  }
  .header>.container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 20px;
  }