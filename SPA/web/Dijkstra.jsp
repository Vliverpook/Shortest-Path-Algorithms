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
        #matrix,#Dijkstra {
            table-layout: fixed;
            width: 100%;
        }

        #matrix,#Dijkstra td {
            width: 14.28%;
        }
        #top td{
            height: 80%;
        }
    </style>
    <script>
        function readdata_matrix(ad_matrix,sideArray){
            for(var i=0;i<sideArray.length;i++){
                ad_matrix[parseInt(sideArray[i].start)-1][parseInt(sideArray[i].end)-1]=parseInt(sideArray[i].weight);
                ad_matrix[parseInt(sideArray[i].end)-1][parseInt(sideArray[i].start)-1]=parseInt(sideArray[i].weight);
            }
        }//邻接矩阵读入函数
        function readdata_struct(edge_struct,sideArray){
            for(var i=0;i<sideArray.length;i++){
                edge_struct.first[i]=parseInt(sideArray[i].start)-1;
                edge_struct.last[i]=parseInt(sideArray[i].end)-1;
                edge_struct.weight[i]=parseInt(sideArray[i].weight);
            }
        }//结构体读入函数
        function Bellman_Ford(begin,sideArray,vertex_num,edge_num){
            this.isInitialized=false;

            this.dis=new Array(vertex_num).fill(Infinity);
            this.first_node=new Array(vertex_num).fill(-1);
            this.path=new Array(vertex_num).fill('');
            this.num=0;
            this.display_num=0;

            this.edge_struct={//结构体（Bellman_Ford）//有点问题
                first:Array(edge_num),//点的编号
                last:Array(edge_num),
                weight:Array(edge_num),
            }

            this.initialize=function(){
                readdata_struct(this.edge_struct,sideArray);
                this.num=this.edge_struct.weight.length;
                this.dis[begin]=0;
                this.isInitialized=true;
            }
            this.Bellman_Ford_seek=function(){
                //for(var i=0;i<vertex_num-1;i++){
                if(this.isInitialized===false){
                    this.initialize();

                }else{


                    for(var j=0;j<this.num;j++){

                        if(this.dis[this.edge_struct.last[j]]>this.dis[this.edge_struct.first[j]]+this.edge_struct.weight[j]){
                            this.dis[this.edge_struct.last[j]]=this.dis[this.edge_struct.first[j]]+this.edge_struct.weight[j];
                            this.first_node[this.edge_struct.last[j]]=this.edge_struct.first[j];//用前驱节点画线


                            //Time_complexity++;
                            this.path[this.edge_struct.last[j]]=String(this.edge_struct.last[j]+1)+"-";
                            var index=this.first_node[this.edge_struct.last[j]];
                            while (index!==begin){
                                this.path[this.edge_struct.last[j]]=this.path[this.edge_struct.last[j]]+String(index+1)+"-";
                                index=this.first_node[index];
                            }
                            this.path[this.edge_struct.last[j]]=this.path[this.edge_struct.last[j]]+String(begin+1);
                        }
                    }
                    this.display_num=this.display_num+1;
                }
                //}
                //判断遍历完后是否有最短路径
                // for(var i=0;i<edge_num;i++){
                //     if(dis[edge_struct.last[i]]>dis[edge_struct.first[i]]+edge_struct.weight[i]){
                //         return false;
                //     }
                // }
                // return true;
            }
            this.getPath=function (){
                return this.path;
            }
            this.getDis=function (){
                return this.dis;
            }
            this.judge=function(){
                if(this.display_num<vertex_num-1){
                    return true;//算法继续
                }else{
                    return false;//算法结束
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
            var nextstep=document.getElementById("Pre");
            var dij=new Bellman_Ford(0,sideArray,6,sideArray.length);
            console.log("11112",sideArray.length);

            var d1=document.getElementById('d1');
            var d2=document.getElementById('d2');
            var d3=document.getElementById('d3');
            var d4=document.getElementById('d4');
            var d5=document.getElementById('d5');
            var d6=document.getElementById('d6');
            var show=document.getElementById("con&res");
            var dis;
            var j=0;
            nextstep.onclick=function (){
                dij.Bellman_Ford_seek();
                dis=dij.getDis();
                // alert(dis);
                d1.innerText=dis[0];
                d2.innerText=dis[1];
                d3.innerText=dis[2];
                d4.innerText=dis[3];
                d5.innerText=dis[4];
                d6.innerText=dis[5];
                if((!dij.judge())&&j===0){
                    j=1;
                    show.innerHTML="path：<br>"
                    for(var i=0;i<=5;i++){
                        show.innerHTML+=(dij.getPath()[i]+"<br>");
                    }
                }
            }
        }
    </script>
</head>
<body>
<div>
    <table id="content">
        <tr id="top">
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

                <table id="Dijkstra" border="2px">
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
                        <td>dis</td>
                        <td id="d1">/</td>
                        <td id="d2">/</td>
                        <td id="d3">/</td>
                        <td id="d4">/</td>
                        <td id="d5">/</td>
                        <td id="d6">/</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td id="td-lb" height=50% width=auto>
                <form id="custom">
                    point1<br><input id="start" type="text"><br>
                    point2<br><input id="end" type="text"><br>
                    weight<br><input id="weight" type="text">
                    <input id="connection" type="button" value="Connect">
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
