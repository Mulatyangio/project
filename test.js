function greet() {
    const now = new Date().getHours();
    const hour = now.getHours();
    console.log(hour);
    if (hour < 12) {
      console.log("Good morning!");
    } else if (hour < 18) {
      console.log("Good afternoon!");
    } else {
      console.log("Good evening!");
    }
  }
  
  greet();