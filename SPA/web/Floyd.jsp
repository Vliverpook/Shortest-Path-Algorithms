<%--
  Created by IntelliJ IDEA.
  User: 20617
  Date: 2023/5/17
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #content{
            width: 100%;
            height: 100%;
        }
        #td-lt{

        }
        #td-lb{

        }
        #td-rt{

        }
        #td-rb{

        }
        #canvas{
            /*background: red;*/
            height: 100%;
            width: 100%;
        }
        #custom{
            margin-left: 20%;
            margin-bottom: 5%;
        }
        #matrix {
            table-layout: fixed;
            width: 100%;
        }

        #matrix td {
            width: 14.28%;
        }
    </style>
    <script src="js/hello.js"></script>
    <script>
        function readdata_matrix(ad_matrix,sideArray){
            for(var i=0;i<sideArray.length;i++){
                ad_matrix[parseInt(sideArray[i].start)-1][parseInt(sideArray[i].end)-1]=parseInt(sideArray[i].weight);
                ad_matrix[parseInt(sideArray[i].end)-1][parseInt(sideArray[i].start)-1]=parseInt(sideArray[i].weight);
            }
        }
        function readdata_struct(edge_struct,sideArray){
            for(var i=0;i<sideArray.length;i++){
                edge_struct.first=parseInt(sideArray[i].start)-1;
                edge_struct.last=parseInt(sideArray[i].end)-1;
                edge_struct.weight=parseInt(sideArray[i].weight);
            }
        }
        function Floyd_Warshall(begin,sideArray,vertex_num){
            this.isInitialized=false;
            this.passvertex=0;


            //this.dis=new Array(vertex_num).fill(Infinity);
            //this.first_node=new Array(vertex_num).fill(-1);
            //this.path=new Array(vertex_num).fill('')

            this.ad_matrix = [];//邻接矩阵（dijkstra）and (Floyd)
            for(var i=0;i<vertex_num;i++){
                this.ad_matrix[i]=[];
                for(var j=0;j<vertex_num;j++){
                    if (i===j){
                        this.ad_matrix[i][j]=0;
                    }else{
                        this.ad_matrix[i][j]=Infinity;
                    }

                }
            }
            this.initialize=function(){
                readdata_matrix(this.ad_matrix,sideArray);
                this.isInitialized=true;
            }

            this.Floyd_Warshall_seek=function(){
                //for(var k=0;k<vertex_num;k++){//每点按钮一次代表所有点经过k点的最短距离实现
                if(this.isInitialized===false){
                    this.initialize();
                    this.isInitialized=true;
                }else{
                    console.log("1");
                    for(var i=0;i<vertex_num;i++){
                        console.log("2");
                        for(var j=0;j<vertex_num;j++){
                            console.log("3");
                            if(this.ad_matrix[i][j]>this.ad_matrix[i][this.passvertex]+this.ad_matrix[this.passvertex][j]){
                                this.ad_matrix[i][j]=this.ad_matrix[i][this.passvertex]+this.ad_matrix[this.passvertex][j];
                                this.ad_matrix[j][i]=this.ad_matrix[i][j];


                                //Time_complexity++;
                            }

                        }

                    }
                    console.log("4");
                    if(this.passvertex<vertex_num){
                        this.passvertex=this.passvertex+1;
                    }
                }
            }
            this.getMatrix=function (){
                return this.ad_matrix;
            }
            this.judge=function(){
                if(this.passvertex===vertex_num){
                    return false;//false表示算法结束
                }else{
                    return true;//true表示算法继续
                }
            }
        }
        window.onload=function () {
            var canvas=document.getElementById("canvas");
            var ctx=canvas.getContext("2d");
            ctx.beginPath();
            ctx.arc(canvas.width/5,canvas.height/2,8,0,2*Math.PI,Math.PI);//point1
            // ctx.stroke();
            ctx.fill();
            ctx.textAlign = 'center';
            ctx.textBaseline = 'middle';
            ctx.font="12px Arial";
            ctx.fillStyle = 'white';
            ctx.fillText("1",canvas.width/5,canvas.height/2);
            ctx.beginPath();
            ctx.fillStyle = 'black';
            ctx.arc((canvas.width/5)*2,canvas.height/4,8,0,2*Math.PI,Math.PI);//point2
            // ctx.stroke();
            ctx.fill();
            ctx.textAlign = 'center';
            ctx.textBaseline = 'middle';
            ctx.font="12px Arial";
            ctx.fillStyle = 'white';
            ctx.fillText("2",(canvas.width/5)*2,canvas.height/4);
            ctx.beginPath();
            ctx.fillStyle = 'black';
            ctx.arc((canvas.width/5)*3,canvas.height/4,8,0,2*Math.PI,Math.PI);//point3
            // ctx.stroke();
            ctx.fill();
            ctx.textAlign = 'center';
            ctx.textBaseline = 'middle';
            ctx.font="12px Arial";
            ctx.fillStyle = 'white';
            ctx.fillText("3",(canvas.width/5)*3,canvas.height/4);
            ctx.beginPath();
            ctx.fillStyle = 'black';
            ctx.arc((canvas.width/5)*4,canvas.height/2,8,0,2*Math.PI,Math.PI);//point4
            // ctx.stroke();
            ctx.fill();
            ctx.textAlign = 'center';
            ctx.textBaseline = 'middle';
            ctx.font="12px Arial";
            ctx.fillStyle = 'white';
            ctx.fillText("4",(canvas.width/5)*4,canvas.height/2);
            ctx.beginPath();
            ctx.fillStyle = 'black';
            ctx.arc((canvas.width/5)*2,(canvas.height/4)*3,8,0,2*Math.PI,Math.PI);//point5
            // ctx.stroke();
            ctx.fill();
            ctx.textAlign = 'center';
            ctx.textBaseline = 'middle';
            ctx.font="12px Arial";
            ctx.fillStyle = 'white';
            ctx.fillText("5",(canvas.width/5)*2,(canvas.height/4)*3);
            ctx.beginPath();
            ctx.fillStyle = 'black';
            ctx.arc((canvas.width/5)*3,(canvas.height/4)*3,8,0,2*Math.PI,Math.PI);//point6
            // ctx.stroke();
            ctx.fill();
            ctx.textAlign = 'center';
            ctx.textBaseline = 'middle';
            ctx.font="12px Arial";
            ctx.fillStyle = 'white';
            ctx.fillText("6",(canvas.width/5)*3,(canvas.height/4)*3);
            class Side{
                constructor(start,end,weight) {
                    this.start=start;
                    this.end=end;
                    this.weight=weight;

                }
            }//边的端点和权重
            var sideArray= [];//用来存放边
            var btnConnection=document.getElementById("connection");//生成连线按钮需要完成的操作
            btnConnection.onclick=function (){
                var start=document.getElementById("start");
                var end=document.getElementById("end");
                var weight=document.getElementById("weight");
                var sPoint=start.value;
                var ePoint=end.value;
                var we=weight.value;
                var side_A=new Side(0,0,0);
                var td1;
                var td2;
                switch (sPoint){
                    case '1':
                        switch (ePoint) {
                            case '1':
                                break;
                            case '2':
                                ctx.beginPath();
                                ctx.moveTo(canvas.width / 5, canvas.height / 2);
                                ctx.lineTo((canvas.width / 5) * 2, canvas.height / 4);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td12");
                                td2=document.getElementById("td21");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '3':
                                ctx.beginPath();
                                ctx.moveTo(canvas.width / 5, canvas.height / 2);
                                ctx.lineTo((canvas.width/5)*3,canvas.height/4);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td13");
                                td2=document.getElementById("td31");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '4':
                                ctx.beginPath();
                                ctx.moveTo(canvas.width / 5, canvas.height / 2);
                                ctx.lineTo((canvas.width/5)*4,canvas.height/2);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td14");
                                td2=document.getElementById("td41");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '5':
                                ctx.beginPath();
                                ctx.moveTo(canvas.width / 5, canvas.height / 2);
                                ctx.lineTo((canvas.width/5)*2,(canvas.height/4)*3);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td15");
                                td2=document.getElementById("td51");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '6':
                                ctx.beginPath();
                                ctx.moveTo(canvas.width / 5, canvas.height / 2);
                                ctx.lineTo((canvas.width/5)*3,(canvas.height/4)*3);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td16");
                                td2=document.getElementById("td61");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            default:
                                break;
                        }
                        break;
                    case '2':
                        switch (ePoint) {
                            case '1':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width / 5) * 2, canvas.height / 4);
                                ctx.lineTo(canvas.width / 5, canvas.height / 2);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td21");
                                td2=document.getElementById("td12");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '2':
                                break;
                            case '3':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width / 5) * 2, canvas.height / 4);
                                ctx.lineTo((canvas.width/5)*3,canvas.height/4);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td23");
                                td2=document.getElementById("td32");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '4':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width / 5) * 2, canvas.height / 4);
                                ctx.lineTo((canvas.width/5)*4,canvas.height/2);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td24");
                                td2=document.getElementById("td42");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '5':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width / 5) * 2, canvas.height / 4);
                                ctx.lineTo((canvas.width/5)*2,(canvas.height/4)*3);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td25");
                                td2=document.getElementById("td52");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '6':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width / 5) * 2, canvas.height / 4);
                                ctx.lineTo((canvas.width/5)*3,(canvas.height/4)*3);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td26");
                                td2=document.getElementById("td62");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            default:
                                break;
                        }
                        break;
                    case '3':
                        switch (ePoint) {
                            case '1':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width/5)*3,canvas.height/4);
                                ctx.lineTo(canvas.width / 5, canvas.height / 2);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td31");
                                td2=document.getElementById("td13");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '2':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width/5)*3,canvas.height/4);
                                ctx.lineTo((canvas.width / 5) * 2, canvas.height / 4);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td32");
                                td2=document.getElementById("td23");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '3':
                                break;
                            case '4':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width/5)*3,canvas.height/4);
                                ctx.lineTo((canvas.width/5)*4,canvas.height/2);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td34");
                                td2=document.getElementById("td43");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '5':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width/5)*3,canvas.height/4);
                                ctx.lineTo((canvas.width/5)*2,(canvas.height/4)*3);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td35");
                                td2=document.getElementById("td53");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '6':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width/5)*3,canvas.height/4);
                                ctx.lineTo((canvas.width/5)*3,(canvas.height/4)*3);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td36");
                                td2=document.getElementById("td63");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            default:
                                break;
                        }
                        break;
                    case '4':
                        switch (ePoint) {
                            case '1':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width/5)*4,canvas.height/2);
                                ctx.lineTo(canvas.width / 5, canvas.height / 2);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td41");
                                td2=document.getElementById("td14");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '2':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width/5)*4,canvas.height/2);
                                ctx.lineTo((canvas.width / 5) * 2, canvas.height / 4);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td42");
                                td2=document.getElementById("td24");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '3':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width/5)*4,canvas.height/2);
                                ctx.lineTo((canvas.width/5)*3,canvas.height/4);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td43");
                                td2=document.getElementById("td34");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '4':
                                break;
                            case '5':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width/5)*4,canvas.height/2);
                                ctx.lineTo((canvas.width/5)*2,(canvas.height/4)*3);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td45");
                                td2=document.getElementById("td54");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '6':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width/5)*4,canvas.height/2);
                                ctx.lineTo((canvas.width/5)*3,(canvas.height/4)*3);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td46");
                                td2=document.getElementById("td64");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            default:
                                break;
                        }
                        break;
                    case '5':
                        switch (ePoint) {
                            case '1':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width/5)*2,(canvas.height/4)*3);
                                ctx.lineTo(canvas.width / 5, canvas.height / 2);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td51");
                                td2=document.getElementById("td15");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '2':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width/5)*2,(canvas.height/4)*3);
                                ctx.lineTo((canvas.width / 5) * 2, canvas.height / 4);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td52");
                                td2=document.getElementById("td25");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '3':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width/5)*2,(canvas.height/4)*3);
                                ctx.lineTo((canvas.width/5)*3,canvas.height/4);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td53");
                                td2=document.getElementById("td35");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '4':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width/5)*2,(canvas.height/4)*3);
                                ctx.lineTo((canvas.width/5)*4,canvas.height/2);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td54");
                                td2=document.getElementById("td45");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '5':
                                break;
                            case '6':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width/5)*2,(canvas.height/4)*3);
                                ctx.lineTo((canvas.width/5)*3,(canvas.height/4)*3);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td56");
                                td2=document.getElementById("td65");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            default:
                                break;
                        }
                        break;
                    case '6':
                        switch (ePoint) {
                            case '1':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width/5)*3,(canvas.height/4)*3);
                                ctx.lineTo(canvas.width / 5, canvas.height / 2);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td61");
                                td2=document.getElementById("td16");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '2':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width/5)*3,(canvas.height/4)*3);
                                ctx.lineTo((canvas.width / 5) * 2, canvas.height / 4);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td62");
                                td2=document.getElementById("td26");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '3':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width/5)*3,(canvas.height/4)*3);
                                ctx.lineTo((canvas.width/5)*3,canvas.height/4);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td63");
                                td2=document.getElementById("td36");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '4':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width/5)*3,(canvas.height/4)*3);
                                ctx.lineTo((canvas.width/5)*4,canvas.height/2);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td64");
                                td2=document.getElementById("td46");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '5':
                                ctx.beginPath();
                                ctx.moveTo((canvas.width/5)*3,(canvas.height/4)*3);
                                ctx.lineTo((canvas.width/5)*2,(canvas.height/4)*3);
                                ctx.stroke();
                                side_A = new Side(sPoint, ePoint, we);
                                sideArray.push(side_A);
                                td1=document.getElementById("td65");
                                td2=document.getElementById("td56");
                                td1.innerText=we;
                                td2.innerText=we;
                                break;
                            case '6':
                                break;
                            default:
                                break;
                        }
                        break;
                    default:
                        break;
                }
                start.value="";
                end.value="";
                weight.value="";
            }
            var pre=document.getElementById("Pre");
            var flo=new Floyd_Warshall(0,sideArray,6);
            var td1=[document.getElementById("td11"),document.getElementById("td12"),document.getElementById("td13"),document.getElementById("td14"),document.getElementById("td15"),document.getElementById("td16")];
            var td2=[document.getElementById("td21"),document.getElementById("td22"),document.getElementById("td23"),document.getElementById("td24"),document.getElementById("td25"),document.getElementById("td26")];
            var td3=[document.getElementById("td31"),document.getElementById("td32"),document.getElementById("td33"),document.getElementById("td34"),document.getElementById("td35"),document.getElementById("td36")];
            var td4=[document.getElementById("td41"),document.getElementById("td42"),document.getElementById("td43"),document.getElementById("td44"),document.getElementById("td45"),document.getElementById("td46")];
            var td5=[document.getElementById("td51"),document.getElementById("td52"),document.getElementById("td53"),document.getElementById("td54"),document.getElementById("td55"),document.getElementById("td56")];
            var td6=[document.getElementById("td61"),document.getElementById("td62"),document.getElementById("td63"),document.getElementById("td64"),document.getElementById("td65"),document.getElementById("td66")];
            var td=[td1,td2,td3,td4,td5,td6];
            var matrix;
            var i,j;
            pre.onclick=function (){
                flo.Floyd_Warshall_seek();
                matrix=flo.getMatrix();
                for(i=0;i<=5;i++){
                    for(j=0;j<=5;j++){
                        if(matrix[i][j]!==Infinity){
                            td[i][j].innerText=matrix[i][j];
                        }else {
                            td[i][j].innerText="∞";
                        }
                    }
                }
            }
        }
    </script>
</head>
<body>
<div>
    <table id="content">
        <tr>
            <td colspan="2" id="td-lt" height=50% width=66.6%>
                <canvas id="canvas"></canvas>
            </td>
            <td id="td-rt" height=50% width=auto>
                <table id="matrix" cellspacing=35px>
                    <tr>
                        <td>&nbsp</td>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td id="td11">0</td>
                        <td id="td12">∞</td>
                        <td id="td13">∞</td>
                        <td id="td14">∞</td>
                        <td id="td15">∞</td>
                        <td id="td16">∞</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td id="td21">∞</td>
                        <td id="td22">0</td>
                        <td id="td23">∞</td>
                        <td id="td24">∞</td>
                        <td id="td25">∞</td>
                        <td id="td26">∞</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td id="td31">∞</td>
                        <td id="td32">∞</td>
                        <td id="td33">0</td>
                        <td id="td34">∞</td>
                        <td id="td35">∞</td>
                        <td id="td36">∞</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td id="td41">∞</td>
                        <td id="td42">∞</td>
                        <td id="td43">∞</td>
                        <td id="td44">0</td>
                        <td id="td45">∞</td>
                        <td id="td46">∞</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td id="td51">∞</td>
                        <td id="td52">∞</td>
                        <td id="td53">∞</td>
                        <td id="td54">∞</td>
                        <td id="td55">0</td>
                        <td id="td56">∞</td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td id="td61">∞</td>
                        <td id="td62">∞</td>
                        <td id="td63">∞</td>
                        <td id="td64">∞</td>
                        <td id="td65">∞</td>
                        <td id="td66">0</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td id="td-lb" height=50% width=auto>
                <form id="custom">
                    point1<br><input id="start" type="text"><br>
                    point2<br><input id="end" type="text"><br>
                    weight<br><input id="weight" type="text"><br><br>
                    <input id="connection" type="button" value="Connect"><br><br>
                    <input id="Pre" type="button" value="Next">
                </form>
            </td>
            <td colspan="2" id="td-rb" height=50% width=66.6%>
                <div id="con&res">

                </div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
