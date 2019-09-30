// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require_tree .

function debounce(func, wait = 20, immediate = true) {
	var timeout;
	return function() {
        var context = this, args = arguments;
        var later = function() {
            timeout = null;
            if (!immediate) func.apply(context, args);
        };
        var callNow = immediate && !timeout;
		clearTimeout(timeout);
		timeout = setTimeout(later, wait); 
			
		
		if (callNow) func.apply(context, args);
	};
};

const sliderImages = document.querySelectorAll('.slide-in');

function checkSlide(e) {
    // console.log(window.screenY);
    sliderImages.forEach(sliderImage => {
        const slideInAt = (window.scrollY + window.innerWidth) -  sliderImage.height / 2;
        const imageBottom = sliderImage.offsetTop
        console.log(slideInAt);
    })
}

window.addEventListener('scroll', debounce(checkSlide));

