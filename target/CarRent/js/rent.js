window.onload=function(){
    let all=document.getElementsByClassName("href");
    for(let i=0;i<all.length;i++){
        all[i].onclick=function(){
            let allC=document.getElementsByClassName("details");
            for(let j=0;j<allC.length;j++){
                if(all[i].innerText==allC[j].getElementsByTagName("h1")[0].innerText){
                    // alert(all[i].innerText);
                    // alert(allC[j].getElementsByTagName("h1")[0].innerText);
                    document.getElementsByClassName("news")[0].style.display = "none";
                    allC[j].style.display = "block";
                }
            }
        }
    }
    let ret = document.getElementsByClassName("return");
    for(let i=0;i<all.length;i++){
        ret[i].onclick=function(){
            document.getElementsByClassName("news")[0].style.display = "block";
            this.parentNode.style.display = "none";
        }
    }
}