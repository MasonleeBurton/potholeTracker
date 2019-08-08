
document.addEventListener('DOMContentLoaded', () => { 
	
	const editButton = document.querySelectorAll('.editButton');
	
	editButton.forEach(element => {
		element.addEventListener('click', (event) => {
		
		console.log(event.target.id);
		const hiddenMenu = document.getElementById("hiddenMenu" + event.target.id);
		
		if (hiddenMenu.classList.contains('displayHidden')) {
			hiddenMenu.classList.remove('displayHidden');
			console.log("Removing thing");
		}
		else {
			hiddenMenu.classList.add('displayHidden');
		}
	})
	});
	
//const deleteButton = document.querySelectorAll('.deleteButton');
//	
//	deleteButton.forEach(element => {
//		element.addEventListener('click', (event) => {
//		
//		console.log(event.target.id);
//		const hiddenMenu = document.getElementById("hiddenMenu" + event.target.id);
//		
//		if (hiddenMenu.classList.contains('displayHidden')) {
//			hiddenMenu.classList.remove('displayHidden');
//			console.log("Removing thing");
//		}
//		else {
//			hiddenMenu.classList.add('displayHidden');
//		}
//	})
//	});
	
	
});