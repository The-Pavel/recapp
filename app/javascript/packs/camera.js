// 'use strict';


// /* globals MediaRecorder */
// // Spec is at http://dvcs.w3.org/hg/dap/raw-file/tip/media-stream-capture/RecordingProposal.html

// var constraints = {audio: true, video: {  width: { min: 320, ideal: 320, max: 640 },  height: { min: 240, ideal: 240, max: 480 }}};
// var recBtn = document.querySelector('button#rec');
// var stopBtn = document.querySelector('button#stop');
// var sbmtBtn = document.querySelector('button#submit');
// // var saveBtn = document.querySelector('button#save');
// // var saveCVBtn = document.querySelector('button#savecv');
// var videoElement = document.querySelector('video');
// var dataElement = document.querySelector('#data');

// // var downloadLink = document.querySelector('a#downloadLink');
// videoElement.controls = false;
// var mediaRecorder;
// var chunks = [];
// var count = 0;


// const recordedVideo = document.querySelector('video#recorded');





//         recBtn.onclick = function onBtnRecordClicked (){
//           if (typeof MediaRecorder === 'undefined' || !navigator.mediaDevices.getUserMedia) {
//             alert('MediaRecorder or navigator.mediaDevices.getUserMedia is NOT supported on your browser, use Firefox or Chrome instead.');
//           }else {
//             recBtn.disabled = true;
//             stopBtn.disabled = false;

//             navigator.mediaDevices.getUserMedia(constraints)
//             .then(function(stream) {
//               /* use the stream */
//               if (typeof MediaRecorder.isTypeSupported == 'function'){
//         /*
//           MediaRecorder.isTypeSupported is a function announced in https://developers.google.com/web/updates/2016/01/mediarecorder and later introduced in the MediaRecorder API spec http://www.w3.org/TR/mediastream-recording/
//           */
//           if (MediaRecorder.isTypeSupported('video/webm;codecs=vp9')) {
//             var options = {mimeType: 'video/webm;codecs=vp9'};
//           } else if (MediaRecorder.isTypeSupported('video/webm;codecs=h264')) {
//             var options = {mimeType: 'video/webm;codecs=h264'};
//           } else  if (MediaRecorder.isTypeSupported('video/webm;codecs=vp8')) {
//             var options = {mimeType: 'video/webm;codecs=vp8'};
//           }
//           mediaRecorder = new MediaRecorder(stream, options);
//         }else{
//           log('isTypeSupported is not supported, using default codecs for browser');
//           mediaRecorder = new MediaRecorder(stream);
//         }

//         mediaRecorder.start(10);
//         videoElement.srcObject = stream;
//         videoElement.play();

//         stream.getTracks().forEach(function(track) {
//           log(track.kind+":"+JSON.stringify(track.getSettings()));
//           console.log(track.getSettings());
//         })

//         mediaRecorder.ondataavailable = function(e) {
//           chunks.push(e.data);
//         };

//         mediaRecorder.onerror = function(e){
//           log('Error: ' + e);
//           console.log('Error: ', e);
//         };

//         mediaRecorder.onstart = function(){
//         // log('Started & state = ' + mediaRecorder.state);
//       };

//       mediaRecorder.onstop = function(){
//         // log('Stopped  & state = ' + mediaRecorder.state);

//         var blob = new Blob(chunks, {type: "video/webm"});
//         chunks = [];

//         function chunksToDataUrl(callback) {
//           var reader = new FileReader();
//           reader.onload = function() {
//             callback(reader.result);
//           };
//           reader.readAsDataURL(blob);

//         }

//         var videoURL = window.URL.createObjectURL(blob);
//         videoElement.src = videoURL;
//         console.log(videoURL);

//         sbmtBtn.onclick = function onBtnSubmitClicked (){
//           var title = document.querySelector('input[name="title"]').value;
//           var formData = new FormData();
//           // formData.append('cv',);
//           formData.append('title', title);
//           formData.append('is_video', true);
//           formData.append('file', blob);

//           var request = new XMLHttpRequest();
//           request.open("post", "http://localhost:3000/cvs");
//           request.send(formData);
//           sbmtBtn.disabled = true;
//           request.onreadystatechange = function () {
//             if (this.readyState == XMLHttpRequest.DONE && this.status == 200) {
//               console.log(this.status);
//           alert("Successfully uploaded");}}
//           }


//         }

//         mediaRecorder.onwarning = function(e){
//           log('Warning: ' + e);
//         };
//       })
// .catch(function(err) {
//   /* handle the error */
//   log('navigator.mediaDevices.getUserMedia error: '+err);
//   console.log('navigator.mediaDevices.getUserMedia error: ', err);

// });
// }
// }

// stopBtn.onclick = function onBtnStopClicked(){
//   let stream = videoElement.srcObject;
//   const superBuffer = new Blob(chunks, {type: 'video/webm'});
//   recordedVideo.src = null;
//   recordedVideo.srcObject = null;
//   recordedVideo.src = window.URL.createObjectURL(superBuffer);
//   recordedVideo.controls = true;
//   recordedVideo.play();
//   mediaRecorder.stop();
//   videoElement.controls = true;

//   recBtn.disabled = false;
//   sbmtBtn.disabled = false;
//   // pauseResBtn.disabled = true;
//   stopBtn.disabled = true;
//   // playBtn.disabled = false;
//   stream.getTracks().forEach(track => track.stop())
// }

// function log(message){
//   dataElement.innerHTML = dataElement.innerHTML;
// }

// function handleSuccess(stream) {
//   recordButton.disabled = false;
//   console.log('getUserMedia() got stream:', stream);
//   window.stream = stream;

//   const gumVideo = document.querySelector('video#gum');
//   gumVideo.srcObject = stream;
// }

// //browser ID
// function getBrowser(){
//   var nVer = navigator.appVersion;
//   var nAgt = navigator.userAgent;
//   var browserName  = navigator.appName;
//   var fullVersion  = ''+parseFloat(navigator.appVersion);
//   var majorVersion = parseInt(navigator.appVersion,10);
//   var nameOffset,verOffset,ix;

//   // In Opera, the true version is after "Opera" or after "Version"
//   if ((verOffset=nAgt.indexOf("Opera"))!=-1) {
//    browserName = "Opera";
//    fullVersion = nAgt.substring(verOffset+6);
//    if ((verOffset=nAgt.indexOf("Version"))!=-1)
//      fullVersion = nAgt.substring(verOffset+8);
//  }
//   // In MSIE, the true version is after "MSIE" in userAgent
//   else if ((verOffset=nAgt.indexOf("MSIE"))!=-1) {
//    browserName = "Microsoft Internet Explorer";
//    fullVersion = nAgt.substring(verOffset+5);
//  }
//   // In Chrome, the true version is after "Chrome"
//   else if ((verOffset=nAgt.indexOf("Chrome"))!=-1) {
//    browserName = "Chrome";
//    fullVersion = nAgt.substring(verOffset+7);
//  }
//   // In Safari, the true version is after "Safari" or after "Version"
//   else if ((verOffset=nAgt.indexOf("Safari"))!=-1) {
//    browserName = "Safari";
//    fullVersion = nAgt.substring(verOffset+7);
//    if ((verOffset=nAgt.indexOf("Version"))!=-1)
//      fullVersion = nAgt.substring(verOffset+8);
//  }
//   // In Firefox, the true version is after "Firefox"
//   else if ((verOffset=nAgt.indexOf("Firefox"))!=-1) {
//    browserName = "Firefox";
//    fullVersion = nAgt.substring(verOffset+8);
//  }
//   // In most other browsers, "name/version" is at the end of userAgent
//   else if ( (nameOffset=nAgt.lastIndexOf(' ')+1) <
//    (verOffset=nAgt.lastIndexOf('/')) )
//   {
//    browserName = nAgt.substring(nameOffset,verOffset);
//    fullVersion = nAgt.substring(verOffset+1);
//    if (browserName.toLowerCase()==browserName.toUpperCase()) {
//     browserName = navigator.appName;
//   }
// }
//   // trim the fullVersion string at semicolon/space if present
//   if ((ix=fullVersion.indexOf(";"))!=-1)
//   fullVersion=fullVersion.substring(0,ix);
//   if ((ix=fullVersion.indexOf(" "))!=-1)
//    fullVersion=fullVersion.substring(0,ix);

//  majorVersion = parseInt(''+fullVersion,10);
//  if (isNaN(majorVersion)) {
//    fullVersion  = ''+parseFloat(navigator.appVersion);
//    majorVersion = parseInt(navigator.appVersion,10);
//  }

//  return browserName;
// }

// TRYING STUFF FOR CAMERATAG
CameraTag.observe('myCamera', 'published', function(){

  console.log('camera ready to Publish');

  var myCamera = CameraTag.cameras["myCamera"];
  var myVideo = myCamera.getVideo();
  console.log(myVideo)
})







