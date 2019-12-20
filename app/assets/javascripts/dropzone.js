// function handleFileSelect(evt) {
//   evt.stopPropagation();
//   evt.preventDefault();

//   files = evt.dataTransfer.files;

//   var output = [];
//   for (var i = 0, f; f = files[i]; i++) {
//     output.push(`<label class="sell-drop__box" for="item_image_image"><script src="jquery.js"></script><script src="dropzone.js"></script>
//                   <i class="fa fa-camera sell-drop__camera"></i>
//                   <p class="sell-drop__box__text"></p>
//                   ドラッグアンドドロップ
//                   <br>
//                   またはクリックしてください
//                   <input class="sell-drop__box__file" style="display: none;" type="file" name="item[image][image]" id="item_image_image">
//                 </label>`);
//   }
//   document.getElementById('list').innerHTML = '<label>' + output.join('') + '</label>';
// }

// function handleDragOver(evt) {
//   evt.stopPropagation();
//   evt.preventDefault();
//   evt.dataTransfer.dropEffect = 'copy'; 
// }

// var dropZone = document.getElementById('sell-drop__box');
// dropZone.addEventListener('item_image_image', handleDragOver, false);
// dropZone.addEventListener('item_image_image', handleFileSelect, false);


// function file_upload()
// {
//     let formdata = () => new FormData($('#item_image_image').get(0));
//     if($('item_image_image').val() == ""){
//       formdata.append('item[image][image]',files[0])
//     }

//     //非同期通信
//     $.ajax({
//         url  : "/upload",
//         type : "POST",
//         data : formdata,
//         cache       : false,
//         contentType : false,
//         processData : false,
//         dataType: 'html',

//     })
//     .done(function(data, textStatus, jqXHR){
//         console.log(data);
//     })
//     .fail(function(jqXHR, textStatus, errorThrown){
//         console.log("fail");
//     })
//     .always(function(data){
//         console.log("complete")
//     });
// }