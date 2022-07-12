class Clock {
    constructor() {
      // 1. Create a Date object.
      // 2. Store the hours, minutes, and seconds.
      // 3. Call printTime.
      // 4. Schedule the tick at 1 second intervals.
      let current_time = new Date();
      this.hours = current_time.getHours();
      this.minutes = current_time.getMinutes();
      this.seconds = current_time.getSeconds();
      this.printTime();
      setInterval(this._tick.bind(this), 1000);
    }
  
    printTime() {
      // Format the time in HH:MM:SS
      // Use console.log to print it.
      const formattedTime = [this.hours, this.minutes, this.seconds].join(':');
      console.log(formattedTime);
    }

    _tick() {
      // 1. Increment the time by one second.
      // 2. Call printTime.
      this.seconds += 1;
      if (this.seconds === 60) {
          this.seconds = 00
          this.minutes += 1
      }
      if (this.minutes === 60) {
          this.minutes = 00
          this.hours += 1
      }
      this.hours = this.hours % 24
      this.printTime();
    }
  }
  
const clock = new Clock();