var country_list = [ 
      "Afghanistan",
      "Albania",
      "Algeria",
      "Andorra",
      "Angola",
      "Anguilla", 
      "Antarctica",
      "Argentina",
      "Armenia", 
      "Aruba",
      "Australia",
      "Austria",
      "Azerbaijan",
      "Bahamas",
      "Bahrain",
      "Bangladesh",
      "Barbados",
      "Belarus",
      "Belgium",
      "Belize",
      "Benin",
      "Bermuda", 
      "Bhutan",
      "Bolivia",
      "Bosnia and Herzegovina",
      "Botswana",
      "Bouvet Island",
      "Brazil",
      "Brunei Darussalam",
      "Bulgaria",
      "Burkina Faso",
      "Burundi",
      "Cambodia",
      "Cameroon", 
      "Canada",
      "Cape Verde",
      "Cayman Islands",
      "Chad",
      "Chile",
      "China",
      "Christmas Island",
      "Cocos Islands",
      "Colombia",
      "Comoros",
      "Congo",
      "Cook Islands",
      "Costa Rica",
      "Cote D'Ivoire",
      "Croatia",
      "Cuba",
      "Cyprus",
      "Czech Republic",
      "Denmark",
      "Djibouti",
      "Dominica",
      "Dominican Republic",
      "Ecuador",
      "Egypt",
      "El Salvador", 
      "Equatorial Guinea",
      "Eritrea",
      "Estonia",
      "Ethiopia",
      "Falkland Islands",
      "Faroe Islands",
      "Fiji",
      "Finland",
      "France",
      "French Guiana",
      "French Polynesia",
      "Gabon",
      "Gambia",
      "Georgia",
      "Germany",
      "Ghana",
      "Gibraltar",
      "Greece",
      "Greenland",
      "Grenada",  
      "Guadeloupe",
      "Guam",
      "Guatemala",
      "Guernsey",
      "Guinea",
      "Guinea-Bissau",
      "Guyana",
      "Haiti",
      "Honduras",
      "Hong Kong",
      "Hungary",
      "Iceland",
      "India",
      "Indonesia",
      "Iran",
      "Iraq",
      "Ireland",
      "Isle of Man",
      "Israel",
      "Italy",
      "Jamaica",
      "Japan",
      "Jersey",
      "Jordan",
      "Kazakhstan",
      "Kenya",
      "Kiribati",
      "Korea",
      "Kuwait",
      "Kyrgyzstan",
      "Latvia",
      "Lebanon",
      "Lesotho",
      "Liberia",
      "Liechtenstein",
      "Lithuania",
      "Luxembourg",
      "Macao",
      "Macedonia",
      "Madagascar",
      "Malawi",
      "Malaysia",
      "Maldives",
      "Mali",
      "Malta",
      "Marshall Islands",
      "Martinique",
      "Mauritania",
      "Mauritius",
      "Mayotte",
      "Mexico",
      "Moldova",
      "Monaco",
      "Mongolia",
      "Montserrat",
      "Morocco",
      "Mozambique",
      "Myanmar",
      "Namibia",
      "Nauru",
      "Nepal",
      "Netherlands",
      "New Caledonia",
      "New Zealand",
      "Nicaragua", 
      "Niger",
      "Nigeria",
      "Niue",
      "Norway",
      "Oman",
      "Pakistan",
      "Palau",
      "Panama",
      "Papua New Guinea",
      "Paraguay",
      "Peru",
      "Philippines",
      "Pitcairn",
      "Poland",
      "Portugal",
      "Puerto Rico",
      "Qatar",
      "Reunion",
      "Romania",
      "Russian Federation",
      "Rwanda",
      "Saint Helena",
      "Saint Lucia",
      "Samoa",
      "San Marino",
      "Saudi Arabia",
      "Senegal",
      "Serbia",
      "Seychelles",
      "Sierra Leone",
      "Singapore",
      "Slovakia",
      "Slovenia",
      "Solomon Islands",
      "Somalia",
      "South Africa",
      "Spain",
      "Sri Lanka",
      "Sudan",
      "Suriname",
      "Swaziland",
      "Sweden",
      "Switzerland",
      "Taiwan",
      "Tajikistan",
      "Tanzania",
      "Thailand",
      "Timor-Leste",
      "Togo",
      "Tokelau",
      "Tonga",
      "Tunisia",
      "Turkey",
      "Turkmenistan",
      "Tuvalu",
      "Uganda",
      "Ukraine",
      "United Arab Emirates",
      "United Kingdom",
      "United States",
      "Uruguay",
      "Uzbekistan",
      "Vanuatu",
      "Venezuela",
      "Viet Nam",
      "Virgin Islands",
      "Wallis and Futuna",
      "Western Sahara",
      "Yemen",
      "Zambia",
      "Zimbabwe",
    ];

function autocomplete(evt) {
  if (evt.keyCode == 13) {
    var box = $(this),
        hintbox = box.siblings('input').first(),
        country = hintbox.val();

    if (country != '') {
        hintbox.add(box).val('');
        var li = $("<li>").text(country);

        li.appendTo("#country_list");
        var route = (box.attr('id') == 'past_countries_box') ? 'past' : 'future';
        $.post('/addcountry/'+route+'/'+country);
    }
  }
}

$(function() {
    $("#past_countries_box").tabcomplete(country_list).on('keyup', autocomplete);
    $("#future_countries_box").tabcomplete(country_list).on('keyup', autocomplete);
  });