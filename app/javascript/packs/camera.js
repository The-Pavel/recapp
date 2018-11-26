

const captureVideoButton =
  document.querySelector('#capture-button');

const stopVideoButton =
  document.querySelector('#stop-button');


  const constraints = {
  video: true,
  audio: true
};


const video =
  document.querySelector('video');


captureVideoButton.onclick = function() {
  navigator.mediaDevices.getUserMedia(constraints).
    then(handleSuccess).catch(handleError);


    navigator.mediaDevices.getUserMedia(constraints).
      then((stream) => {video.srcObject = stream});


    function handleSuccess(stream) {
      video.srcObject = stream;
    }
};


stopVideoButton.onclick = function stopStreamedVideo(videoElem) {
    let stream = video.srcObject;
    let tracks = stream.getTracks();

    tracks.forEach(function(track) {
      track.stop();
    });

    video.srcObject = null;
};

