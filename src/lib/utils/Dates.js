export const Dates = {

    getVerboseDateTime: function(dateStr) {
        const date = new Date(dateStr);
        const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
        return date.toLocaleDateString('en-US', options) + " - " + date.toLocaleTimeString('pt-PT');
    },


    getFormattedDateTime: function(dateStr) {
        const date = new Date(dateStr);
        let formattedDate = (date.getDate() < 10 ? '0' : '') + date.getDate() + '/' + ((date.getMonth() + 1) < 10 ? '0' : '') + (date.getMonth() + 1) + '/' + date.getFullYear();
        let formattedTime = (date.getHours() < 10 ? '0' : '') + date.getHours() + ':' + (date.getMinutes() < 10 ? '0' : '') + date.getMinutes() + ':' + (date.getSeconds() < 10 ? '0' : '') + date.getSeconds();

        return formattedDate + " " + formattedTime;
    },

    getDaysBetweenDates: function(firstDate, secondDate) {
        const oneDay = 24 * 60 * 60 * 1000;
        const timeDifference = Math.abs(firstDate - secondDate);
        const numberOfDays = Math.round(timeDifference / oneDay);
        return numberOfDays;
      }
}