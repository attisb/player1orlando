(function( $ ) {
	$.fn.dequarkSelects = function() {
		return this.each(function() {
			var $this = $(this);
			$this.wrap("<div class=\"select\">");
			$this.parent().append("<i class=\"select_icon icon-sort\"></i>");
			if(i = $this.attr("class")) {		$this.parent().addClass(i);}
			if(i = $this.attr("disabled")) {	$this.parent().addClass(i);}
			$this.bind("focus", function() {	$(this).parent().addClass("selectfocus");
			}).bind("blur", function(){			$(this).parent().removeClass("selectfocus");
			});
		});
	};

	$.fn.dequarkFileInputs = function() {
		var $this = $(this);
		var filename = ($this.val() == "") ? "choose file" : $this.val();

		$this.wrap("<div class=\"file\">");
		$this.parent().append("<span class=\"filename\"></span>");
		var file_tag = $this.closest("div").children(".filename")

		file_tag.text(filename);
		$this.bind("change", function() {
			var filechange = $(this).val().split('\\').pop();
			filename = (filechange == "") ? "choose file" : filechange;
			file_tag = $(this).closest("div").children(".filename")
			file_tag.text( filename );
		}).bind("focus", function() {	$(this).parent().addClass("filefocus");
		}).bind("blur", function(){		$(this).parent().removeClass("filefocus");
		});
	};
	
	$.fn.dequarkInputLimits = function(type_limit) {
		return this.keypress(function(e) {
			if(type_limit == "numbers") {
				return ( e.which!=8 && e.which!=0 && (e.which<48 || e.which>57)) ? false : true ;
			} else if (type_limit == "email") {
				var regex = new RegExp("^[a-zA-Z0-9@._+-]+$"),
					key = String.fromCharCode(!e.charCode ? e.which : e.charCode);
			    if (!regex.test(key)) {
			       e.preventDefault();
			       return false;
			    }						
			}
		});
	};
})( jQuery );

$(function() {
	$("html").removeClass("nojquery");
	$("html").removeClass("no-js");
	
	$('input[type=file]').dequarkFileInputs();
	$('.numbersonly').dequarkInputLimits("numbers");
	$('.emailonly').dequarkInputLimits("email");
	$('select').dequarkSelects();
	
	$("#pull").on('click', function(e) {  
		e.preventDefault();
		$("header nav").slideToggle('slow');  
	});
});
