import {htmlGenerator} from "./warmup";

export class Clock {
    constructor() {
        // 1. Create a Date object.
        const currentTime = new Date();

        // 2. Store the hour, minute, and second.
        this.hours = currentTime.getHours();
        this.minutes = currentTime.getMinutes();
        this.seconds = currentTime.getSeconds();

        // 3. Call printTime.
        this.printTime();

        // 4. Schedule the tick at 1 second intervals.
        htmlGenerator(this.printTime(), clockElement);
        setInterval(this._tick.bind(this), 1000);
    }

    printTime() {
        const timeString = [this.hours, this.minutes, this.seconds].join(":");
        return timeString;
    }

    _tick() {
        this._incrementSeconds();

        htmlGenerator(this.printTime(), clockElement);
    }

    _incrementSeconds() {
        this.seconds += 1;
        if (this.seconds === 60) {
            this.seconds = 0;
            this._incrementMinutes();
        }
    }

    _incrementMinutes() {
        this.minutes += 1;
        if (this.minutes === 60) {
            this.minutes = 0;
            this._incrementHours();
        }
    }

    _incrementHours() {
        this.hours = (this.hours + 1) % 24;
    }
}

let clockElement = document.getElementById("clock");
const clock = new Clock();
