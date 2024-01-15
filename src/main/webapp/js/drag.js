function allowDrop(event) {
        event.preventDefault();
      }

function drop(event) {
	event.preventDefault();
	var a = event.dataTransfer.getData("a");
	var b = document.getElementById(a);
	var wrapper__right__header = document.getElementById("wrapper__right__id");
	wrapper__right__header.appendChild(b);
}

      
function allowDrop(event) {
	event.preventDefault();
	}

function drop(event) {
	event.preventDefault();
	var a = event.dataTransfer.getData("a");
	var b = document.getElementById(a);
	var c = document.getElementById("wrapper__right__id");
	c.appendChild(b);
}

// 상품요소들이 드래그 가능하도록 하는 코드 추가 
var d = document.querySelectorAll(".left__body__call");
	for (var i = 0; i < d.length; i++) {
	d[i].addEventListener("dragstart", function (event) {
	event.dataTransfer.setData("a", event.target.id);
	});
}