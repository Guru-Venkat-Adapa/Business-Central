function SetProgress(progress) {
     debugger;
    const test = document.querySelectorAll('.test');
        progressBar = document.querySelector(".indicator");
        // console.log(test);
        // console.log(progressBar);
        console.log(progress);
//ghetting circles based on enum
        test.forEach((test,index)=>{
            test.classList[`${index<progress? "add" : "remove"}`]("active");
        });
//getting progress bar based on the circles
    progressBar.style.width = `${((progress-1)/(test.length-1))*100}%`

};