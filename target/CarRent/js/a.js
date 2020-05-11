function setTab(name, cursel) {
    // alert("con_"+name);
    links_len = document.getElementsByClassName("con_"+name).length;
    console.log(document.getElementsByClassName("con_" + name));
    if(name=="one"){
        links_len=links_len-1;
    }
    for (var i = 1; i <= links_len; i++) {
        var content = document.getElementById(name + i);
        var rightContent = document.getElementById("con_" + name + "_" + i);
        if (i == cursel) {
            content.className = "off";
            rightContent.style.display = "block";
        } 
        else {
            content.className = "";
            rightContent.style.display = "none";
        }
    }
}

function none() {
    document.getElementById("con_one_0").style.display = "none";
}

function block() {
    document.getElementById("con_one_0").style.display = "block";
}

function tan01(){
    document.getElementById('zhezhao01').style.display="block";
}

function hidder01(){
    document.getElementById('zhezhao01').style.display="none";
}

function tan02(){
    document.getElementById('zhezhao02').style.display="block";
}

function hidder02(){
    document.getElementById('zhezhao02').style.display="none";
}

function tan03(){
    document.getElementById('zhezhao03').style.display="block";
}

function hidder03(){
    document.getElementById('zhezhao03').style.display="none";
}

function tan04(){
    document.getElementById('zhezhao04').style.display="block";
}

function hidder04(){
    document.getElementById('zhezhao04').style.display="none";
}

function tan05(){
    document.getElementById('zhezhao05').style.display="block";
}

function hidder05(){
    document.getElementById('zhezhao05').style.display="none";
}

function tan06(){
    document.getElementById('zhezhao06').style.display="block";
}

function hidder06(){
    document.getElementById('zhezhao06').style.display="none";
}

function tan07(){
    document.getElementById('zhezhao07').style.display="block";
}

function hidder07(){
    document.getElementById('zhezhao07').style.display="none";
}

function tan08(){
    document.getElementById('zhezhao08').style.display="block";
}

function hidder08(){
    document.getElementById('zhezhao08').style.display="none";
}

function tan09(){
    document.getElementById('zhezhao09').style.display="block";
}

function hidder09(){
    document.getElementById('zhezhao09').style.display="none";
}

function tan10(){
    document.getElementById('zhezhao10').style.display="block";
}

function hidder10(){
    document.getElementById('zhezhao10').style.display="none";
}

function tan11(){
    document.getElementById('zhezhao11').style.display="block";
}

function hidder11(){
    document.getElementById('zhezhao11').style.display="none";
}

function tan12(){
    document.getElementById('zhezhao12').style.display="block";
}

function hidder12(){
    document.getElementById('zhezhao12').style.display="none";
}

function tan13(){
    document.getElementById('zhezhao13').style.display="block";
}

function hidder13(){
    document.getElementById('zhezhao13').style.display="none";
}

function tan14(){
    document.getElementById('zhezhao14').style.display="block";
}

function hidder14(){
    document.getElementById('zhezhao14').style.display="none";
}

function tan15(){
    document.getElementById('zhezhao15').style.display="block";
}

function hidder15(){
    document.getElementById('zhezhao15').style.display="none";
}

function tan16(){
    document.getElementById('zhezhao16').style.display="block";
}

function hidder16(){
    document.getElementById('zhezhao16').style.display="none";
}

function tan17(){
    document.getElementById('zhezhao17').style.display="block";
}

function hidder17(){
    document.getElementById('zhezhao17').style.display="none";
}

function tan18(){
    document.getElementById('zhezhao18').style.display="block";
}

function hidder18(){
    document.getElementById('zhezhao18').style.display="none";
}