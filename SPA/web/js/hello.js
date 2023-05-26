    var vertex_num = 6;
    var edge_num=sideArray.length;
    //var Time_complexity=0;

    // var dis=new Array(vertex_num).fill(Infinity);
    // var first_node=new Array(vertex_num).fill(-1);
    // var visit=new Array(vertex_num).fill(false);
    // var path=new Array(vertex_num).fill('')

    // var ad_matrix = new Array();//邻接矩阵（dijkstra）and (Floyd)
    //     for(var i=0;i<vertex_num;i++){
    //         ad_matrix[i]=new Array();
    //         for(var j=0;j<vertex_num;j++){
    //             if (i==j){
    //                 ad_matrix[i][j]=0;
    //             }else{
    //                 ad_matrix[i][j]=Infinity;
    //             }
    //
    //         }
    //     }

    //
    // function initializeMatrix(vertex_num,ad_matrix) {//将邻接矩阵初始化
    //     for (var i = 0; i < vertex_num; i++) {
    //         for (var j = 0; j < vertex_num; j++) {
    //             if (i === j) {
    //                 ad_matrix[i][j] = 0;
    //             } else {
    //                 ad_matrix[i][j] = Infinity;
    //             }
    //         }
    //     }
    // }

    //邻接矩阵读入函数
    function readdata_matrix(ad_matrix,sideArray){
        for(var i=0;i<sideArray.length;i++){
            ad_matrix[parseInt(sideArray[i].start)-1][parseInt(sideArray[i].end)-1]=parseInt(sideArray[i].weight);
            ad_matrix[parseInt(sideArray[i].end)-1][parseInt(sideArray[i].start)-1]=parseInt(sideArray[i].weight);
        }
    }


    // var edge_struct={//结构体（Bellman_Ford）
    //     first:Array(edge_num),//点的编号
    //     last:Array(edge_num),
    //     weight:Array(edge_num),
    // }
        //结构体读入函数
    function readdata_struct(edge_struct,sideArray){
        for(var i=0;i<sideArray.length;i++){
            edge_struct.first=parseInt(sideArray[i].start)-1;
            edge_struct.last=parseInt(sideArray[i].end)-1;
            edge_struct.weight=parseInt(sideArray[i].weight);
        }
    }


    function dijkstra(begin,sideArray,vertex_num){//begin 0对应1号点
        // this.isInitialized=false;
        this.seek_num=false;
        this.dis=new Array(vertex_num).fill(Infinity);
        this.first_node=new Array(vertex_num).fill(-1);
        this.path=new Array(vertex_num).fill('')
        this.visit=new Array(vertex_num).fill(false);
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
        // this.initialize=function(){
        //     initializeMatrix(vertex_num);
        //     readdata_matrix(sideArray);
        //     dis.fill(Infinity);//到begin的距离
        //     first_node.fill(-1);//前驱节点
        //     visit.fill(false);//dijkstra中判断有无访问过
        //     path.fill('')//路径
        //     this.seek_num=false;
        //     this.isInitialized=true;
        // }

        this.dijkstra_seek=function(){
            //for(var i=0;i<vertex_num-1;i++){
            if(this.seek_num===false){
                readdata_matrix(this.ad_matrix,sideArray);
                for(var i=0;i<vertex_num;i++){
                    if(this.ad_matrix[begin][i]!==Infinity){
                        this.dis[i]=this.ad_matrix[begin][i];
                        this.first_node[i]=begin;
                    }
                }
                for(var i=0;i<vertex_num;i++){
                    if(this.first_node[i]!==-1){
                        this.path[i]=String(i+1)+"-"+String(begin+1);
                    }

                }
                this.visit[begin]=true;
                this.seek_num=true;
            }else{
                var min_index=-1;
                var min_dis=Infinity;


                for(var j=0;j<vertex_num;j++){
                    if(min_dis>this.dis[j] && this.visit[j]===false){
                        min_dis=this.dis[j];
                        min_index=j;
                    }
                }
                if(min_dis===Infinity){
                    //break;//没有点可以到达
                }
                this.visit[min_index]=true;

                for(var k=0;k<vertex_num;k++){
                    if(this.ad_matrix[min_index][k]!==Infinity&&this.dis[k]>this.dis[min_index]+this.ad_matrix[min_index][k]){
                        this.dis[k]=this.dis[min_index]+this.ad_matrix[min_index][k];
                        this.first_node[k]=min_index;
                        //Time_complexity++;

                        this.path[k]=String(k+1)+"-";
                        var index=this.first_node[k];
                        while (index!==begin){
                            this.path[k]=this.path[k]+String(index+1)+"-";
                            index=this.first_node[index];
                        }
                        this.path[k]=this.path[k]+String(begin+1);

                    }
                }


            }

            //}
        }
        this.getPath=function(){
            return this.path;//路径
        }
        this.getDis=function (){
            return this.dis;//距离
        }

    }



    function Bellman_Ford(begin,sideArray,vertex_num,edge_num){
        this.isInitialized=false;

        this.dis=new Array(vertex_num).fill(Infinity);
        this.first_node=new Array(vertex_num).fill(-1);
        this.path=new Array(vertex_num).fill('')

        this.edge_struct={//结构体（Bellman_Ford）
            first:Array(edge_num),//点的编号
            last:Array(edge_num),
            weight:Array(edge_num),
        }

        this.initialize=function(){
            readdata_struct(this.edge_struct,sideArray);
            // dis.fill(Infinity);
            // first_node.fill(-1);
            // path.fill("");
            dis[begin]=0;
            this.isInitialized=true;
        }
        this.Bellman_Ford_seek=function(){
            //for(var i=0;i<vertex_num-1;i++){

            for(var j=0;j<edge_num;j++){
                if(this.dis[this.edge_struct.last[j]]>this.dis[this.edge_struct.first[j]]+this.edge_struct.weight[j]){
                    this.dis[this.edge_struct.last[j]]=this.dis[this.edge_struct.first[j]]+this.edge_struct.weight[j];
                    this.first_node[this.edge_struct.last[j]]=this.edge_struct.first[j];//用前驱节点画线
                    //Time_complexity++;
                    this.path[this.edge_struct.last[j]]=String(this.edge_struct.last[j])+"-";
                    var index=this.first_node[this.edge_struct.last[j]];
                    while (index!==begin){
                        this.path[this.edge_struct.last[j]]=this.path[this.edge_struct.last[j]]+String(index)+"-";
                        index=this.first_node[index];
                    }
                    this.path[this.edge_struct.last[j]]=this.path[this.edge_struct.last[j]]+String(begin);
                }
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

    }



    function Floyd_Warshall(begin,sideArray,vertex_num){
        this.isInitialized=false;

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
                for(var i=0;i<vertex_num;i++){
                    for(var j=0;j<vertex_num;j++){
                        if(this.ad_matrix[i][j]>this.ad_matrix[i][k]+this.ad_matrix[k][j]){
                            this.ad_matrix[i][j]=this.ad_matrix[i][k]+this.ad_matrix[k][j];
                            this.ad_matrix[j][i]=this.ad_matrix[i][j];
                            //Time_complexity++;
                        }
                    }
                }
            }
        }
        this.getMatrix=function (){
            return this.ad_matrix;
        }
    }









