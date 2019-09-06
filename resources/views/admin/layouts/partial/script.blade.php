<script src="{{ asset('assets') }}/admin/libs/jquery/jquery/dist/jquery.js"></script>
<script src="{{ asset('assets') }}/admin/libs/jquery/bootstrap/dist/js/bootstrap.js"></script>
<script src="{{ asset('assets') }}/admin/js/ui-load.js"></script>
<script src="{{ asset('assets') }}/admin/js/ui-jp.config.js"></script>
<script src="{{ asset('assets') }}/admin/js/ui-jp.js"></script>
<script src="{{ asset('assets') }}/admin/js/ui-nav.js"></script>
<script src="{{ asset('assets') }}/admin/js/ui-toggle.js"></script>
<script src="{{ asset('assets') }}/admin/js/ui-client.js"></script>
<script src="{{ asset('assets') }}/admin/js/ui-client.js"></script>

<!--Froala Editor-->
<script type="text/javascript" src="{{ asset('assets') }}/admin/libs/jquery/froala/js/froala_editor.min.js" ></script>
<script type="text/javascript" src="{{ asset('assets') }}/admin/libs/jquery/froala/js/plugins/align.min.js"></script>
<script type="text/javascript" src="{{ asset('assets') }}/admin/libs/jquery/froala/js/plugins/char_counter.min.js"></script>
<script type="text/javascript" src="{{ asset('assets') }}/admin/libs/jquery/froala/js/plugins/code_beautifier.min.js"></script>
<script type="text/javascript" src="{{ asset('assets') }}/admin/libs/jquery/froala/js/plugins/code_view.min.js"></script>
<script type="text/javascript" src="{{ asset('assets') }}/admin/libs/jquery/froala/js/plugins/colors.min.js"></script>
<script type="text/javascript" src="{{ asset('assets') }}/admin/libs/jquery/froala/js/plugins/draggable.min.js"></script>
<script type="text/javascript" src="{{ asset('assets') }}/admin/libs/jquery/froala/js/plugins/entities.min.js"></script>
<script type="text/javascript" src="{{ asset('assets') }}/admin/libs/jquery/froala/js/plugins/font_size.min.js"></script>
<script type="text/javascript" src="{{ asset('assets') }}/admin/libs/jquery/froala/js/plugins/fullscreen.min.js"></script>
<script type="text/javascript" src="{{ asset('assets') }}/admin/libs/jquery/froala/js/plugins/image.min.js"></script>
<script type="text/javascript" src="{{ asset('assets') }}/admin/libs/jquery/froala/js/plugins/image_manager.min.js"></script>
<script type="text/javascript" src="{{ asset('assets') }}/admin/libs/jquery/froala/js/plugins/line_breaker.min.js"></script>
<script type="text/javascript" src="{{ asset('assets') }}/admin/libs/jquery/froala/js/plugins/link.min.js"></script>
<script type="text/javascript" src="{{ asset('assets') }}/admin/libs/jquery/froala/js/plugins/lists.min.js"></script>
<script type="text/javascript" src="{{ asset('assets') }}/admin/libs/jquery/froala/js/plugins/paragraph_format.min.js"></script>
<script type="text/javascript" src="{{ asset('assets') }}/admin/libs/jquery/froala/js/plugins/quote.min.js"></script>
<script type="text/javascript" src="{{ asset('assets') }}/admin/libs/jquery/froala/js/plugins/table.min.js"></script>
<script type="text/javascript" src="{{ asset('assets') }}/admin/libs/jquery/froala/js/plugins/save.min.js"></script>
<script type="text/javascript" src="{{ asset('assets') }}/admin/libs/jquery/froala/js/plugins/url.min.js"></script>
<script type="text/javascript" src="{{ asset('assets') }}/admin/libs/jquery/froala/js/plugins/video.min.js"></script>
<script src="{{ asset('assets') }}/admin/libs/dropzone/dropzone.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>

<!-- Fancybox -->
<script src="{{ asset('assets') }}/admin/libs/fancybox/jquery.fancybox.min.js"></script>

<!--Nestable-->
<script src="{{ asset('assets') }}/admin/libs/jquery/nestable/jquery.nestable.js"></script>

<!--ColorPicker-->
<script src="{{ asset('assets') }}/admin/libs/colorpicker/js/bootstrap-colorpicker.js"></script>

<!--Component-->
<script src="{{ asset('assets') }}/admin/js/component-script.js"></script>
<script src="{{ asset('assets') }}/admin/js/component-jquery.js"></script>



<script type="text/javascript">
/*
function initialize() {

    $('form').on('keyup keypress', function(e) {
        var keyCode = e.keyCode || e.which;
        if (keyCode === 13) {
            e.preventDefault();
            return false;
        }
    });
    const locationInputs = document.getElementsByClassName("map-input");

    const autocompletes = [];
    const geocoder = new google.maps.Geocoder;
    for (let i = 0; i < locationInputs.length; i++) {

        const input = locationInputs[i];
        const fieldKey = input.id.replace("-input", "");
        const isEdit = document.getElementById(fieldKey + "-latitude").value != '' && document.getElementById(fieldKey + "-longitude").value != '';

        const latitude = parseFloat(document.getElementById(fieldKey + "-latitude").value) || -33.8688;
        const longitude = parseFloat(document.getElementById(fieldKey + "-longitude").value) || 151.2195;

        const map = new google.maps.Map(document.getElementById(fieldKey + '-map'), {
            center: {lat: latitude, lng: longitude},
            zoom: 13
        });
        const marker = new google.maps.Marker({
            map: map,
            position: {lat: latitude, lng: longitude},
        });

        marker.setVisible(isEdit);

        const autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.key = fieldKey;
        autocompletes.push({input: input, map: map, marker: marker, autocomplete: autocomplete});
    }

    for (let i = 0; i < autocompletes.length; i++) {
        const input = autocompletes[i].input;
        const autocomplete = autocompletes[i].autocomplete;
        const map = autocompletes[i].map;
        const marker = autocompletes[i].marker;

        google.maps.event.addListener(autocomplete, 'place_changed', function () {
            marker.setVisible(false);
            const place = autocomplete.getPlace();

            geocoder.geocode({'placeId': place.place_id}, function (results, status) {
                if (status === google.maps.GeocoderStatus.OK) {
                    const lat = results[0].geometry.location.lat();
                    const lng = results[0].geometry.location.lng();
                    setLocationCoordinates(autocomplete.key, lat, lng);
                }
            });

            if (!place.geometry) {
                window.alert("No details available for input: '" + place.name + "'");
                input.value = "";
                return;
            }

            if (place.geometry.viewport) {
                map.fitBounds(place.geometry.viewport);
            } else {
                map.setCenter(place.geometry.location);
                map.setZoom(17);
            }
            marker.setPosition(place.geometry.location);
            marker.setVisible(true);

        });
    }
}

function setLocationCoordinates(key, lat, lng) {
const latitudeField = document.getElementById(key + "-" + "latitude");
const longitudeField = document.getElementById(key + "-" + "longitude");
latitudeField.value = lat;
longitudeField.value = lng;
}
Karena blog ini tentang Laravel dan bukan JavaScript, saya tidak akan terlalu banyak mengomentarinya. Cukup jelas:

Bagian ini memuat peta dan menempatkan penanda pusat:

const map = new google.maps.Map(document.getElementById(fieldKey + '-map'), {
        center: {lat: latitude, lng: longitude},
        zoom: 13
    });
const marker = new google.maps.Marker({
map: map,
position: {lat: latitude, lng: longitude},
});

const autocomplete = new google.maps.places.Autocomplete(input);
autocomplete.key = fieldKey;
autocompletes.push({input: input, map: map, marker: marker, autocomplete: autocomplete});

 
geocoder.geocode({'placeId': place.place_id}, function (results, status) {
    if (status === google.maps.GeocoderStatus.OK) {

        const lat = results[0].geometry.location.lat();
        const lng = results[0].geometry.location.lng();

        setLocationCoordinates(autocomplete.key, lat, lng);
    }
});

*/

  $(document).ready(function(){

    $.ajax({
       url: '{{ route('list_menu') }}',
       type: 'GET',
       dataType: 'JSON',
       success: function (data) {
         $(".editor").froalaEditor({
           linkList: data,
           theme: "custom",
           imageMaxSize: 1024 * 1024 * 3,
           imageUploadURL: "{{route('upload_image')}}",
           imageUploadParams: 'file_name',
           imageUploadMethod: 'POST',
           imageUploadParams: {
             froala: 'true',
             _token: "{{ csrf_token() }}"
           },
           imageManagerPreloader: "/assets/admin/img/load.gif",
           imageManagerLoadURL: '{{route('list_image')}}',
           imageManagerLoadMethod: "GET",
           imageManagerPageSize: 20,
           imageManagerScrollOffset: 10
         }).on('froalaEditor.image.inserted', function (e, editor, $img) {
           var content = $(".fr-element.fr-view").html();
           for (var i = 0; i < $img.length; i++) {
             $(".fr-element.fr-view").html(content.replace($img[i].outerHTML,'<a href='+$($img[i]).attr('src')+'>'+$img[i].outerHTML+'</a>'));
           }
         });
       }
    });

  });

</script>
