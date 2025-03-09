<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <!-- font-awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">


    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <!-- layui -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
</head>
<style>

</style>
<body>


    <div class="modal fade" id="qingjiaYesnoTypesModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">审核</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        审核：
                        <div class="col-sm-9">
                            <input type="hidden" id="qingjiaYesnoTypesId">
                            <select id="qingjiaYesnoTypes" name="qingjiaYesnoTypes" class="form-control">
                                <option value="2">通过</option>
                                <option value="3">拒绝</option>
                            </select>
                        </div>
                    </div>
                       <div class="row">
                           审核原因：
                           <textarea style="width: 450px"  id="qingjiaYesnoText" name="qingjiaYesnoText" class="form-control"placeholder="审核原因"></textarea>
                       </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                    <button type="button" id="receive" onclick="qingjiaYesnoTypesShenhe()" class="btn btn-primary">提交</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Pre Loader -->
    <div class="loading">
        <div class="spinner">
            <div class="double-bounce1"></div>
            <div class="double-bounce2"></div>
        </div>
    </div>
<!--/Pre Loader -->
    <div class="wrapper">
        <!-- Page Content -->
        <div id="content">
            <!-- Top Navigation -->
            <%@ include file="../../static/topNav.jsp" %>
            <!-- Menu -->
            <div class="container menu-nav">
                <nav class="navbar navbar-expand-lg lochana-bg text-white">
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="ti-menu text-white"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul id="navUl" class="navbar-nav mr-auto">
                        </ul>
                    </div>
                </nav>
            </div>
            <!-- /Menu -->
            <!-- Breadcrumb -->
            <!-- Page Title -->
            <div class="container mt-0">
                <div class="row breadcrumb-bar">
                    <div class="col-md-6">
                        <h3 class="block-title">请假管理</h3>
                    </div>
                    <div class="col-md-6">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/index.jsp">
                                    <span class="ti-home"></span>
                                </a>
                            </li>
                            <li class="breadcrumb-item">请假管理</li>
                            <li class="breadcrumb-item active">请假列表</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /Page Title -->

            <!-- /Breadcrumb -->
            <!-- Main Content -->
            <div class="container">
                <div class="row">
                    <!-- Widget Item -->
                    <div class="col-md-12">
                        <div class="widget-area-2 lochana-box-shadow">
                            <h3 class="widget-title">请假列表</h3>
                            <div class="table-responsive mb-3">
                                <div class="col-sm-12">
                                                                                                             
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        请假名称
                                        <div class="layui-input-inline">
                                            <input type="text" id="qingjiaNameSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="请假名称" aria-controls="tableId">
                                        </div>
                                    </div>
                                     
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        请假类型
                                        <div class="layui-input-inline">
                                            <select name="qingjiaTypesSelectSearch"  style="width: 150px;" id="qingjiaTypesSelectSearch" class="form-control form-control-sm"
                                                    aria-controls="tableId">
                                            </select>
                                        </div>
                                    </div>
                                                                                                                                                                                     
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        申请状态
                                        <div class="layui-input-inline">
                                            <select name="qingjiaYesnoTypesSelectSearch"  style="width: 150px;" id="qingjiaYesnoTypesSelectSearch" class="form-control form-control-sm"
                                                    aria-controls="tableId">
                                            </select>
                                        </div>
                                    </div>
                                                                                                            
                                                                                                         
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        职工姓名
                                        <div class="layui-input-inline">
                                            <input type="text" id="zhigongNameSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="职工姓名" aria-controls="tableId">
                                        </div>
                                    </div>
                                                                                                                                                                                                                                                                     
                                                     
                                                    
                                    <div class="layui-inline" style="margin-left: 30px;margin-bottom: 10px;">
                                        <button onclick="search()" type="button" class="btn btn-primary">查询</button>
                                        <button onclick="add()" type="button" class="btn btn-primary 新增">添加</button>
                                        <button onclick="graph()" type="button" class="btn btn-primary 报表">报表</button>
                                        <button onclick="exportExcel()" type="button" class="btn btn-success 导入导出"><i class="fa fa-file-excel-o" aria-hidden="true"></i>导出</button>
                                        <button onclick="deleteMore()" type="button" class="btn btn-danger 删除">批量删除</button>
                                    </div>
                                </div>
                                <table id="tableId" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th class="no-sort" style="min-width: 35px;">
                                            <div class="custom-control custom-checkbox">
                                                <input class="custom-control-input" type="checkbox" id="select-all"
                                                       onclick="chooseAll()">
                                                <label class="custom-control-label" for="select-all"></label>
                                            </div>
                                        </th>

                                        <th >职工姓名</th>
                                        <th >职工手机号</th>
                                        <th >职工头像</th>
                                        <th>请假名称</th>
                                        <th>请假类型</th>
                                        <th>请假开始时间</th>
                                        <th>请假结束时间</th>
                                        <th>申请时间</th>
                                        <th>申请状态</th>
                                        <th>审核理由</th>
                                        <th>审核时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="thisTbody">
                                    </tbody>
                                </table>
                                <div class="col-md-6 col-sm-3">
                                    <div class="dataTables_length" id="tableId_length">

                                        <select name="tableId_length" aria-controls="tableId" id="selectPageSize"
                                                onchange="changePageSize()">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                        条 每页

                                    </div>
                                </div>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-end">
                                        <li class="page-item" id="tableId_previous" onclick="pageNumChange('pre')">
                                            <a class="page-link" href="#" tabindex="-1">上一页</a>
                                        </li>

                                        <li class="page-item" id="tableId_next" onclick="pageNumChange('next')">
                                            <a class="page-link" href="#">下一页</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <!-- /Widget Item -->
                </div>
            </div>
            <!-- /Main Content -->

        </div>
        <!-- /Page Content -->
    </div>
    <!-- Back to Top -->
    <a id="back-to-top" href="#" class="back-to-top">
        <span class="ti-angle-up"></span>
    </a>
    <!-- /Back to Top -->
    <%@ include file="../../static/foot.jsp" %>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/excel-gen.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/jszip.min.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/FileSaver.js"></script>
    <script>

        <%@ include file="../../utils/menu.jsp"%>
        <%@ include file="../../static/setMenu.js"%>
        <%@ include file="../../utils/baseUrl.jsp"%>
        <%@ include file="../../static/getRoleButtons.js"%>
        <%@ include file="../../static/crossBtnControl.js"%>
        var tableName = "qingjia";
        var pageType = "list";
        var searchForm = {key: ""};
        var pageIndex = 1;
        var pageSize = 10;
        var totalPage = 0;
        var dataList = [];
        var sortColumn = '';
        var sortOrder = '';
        var ids = [];
        var checkAll = false;

        <!-- 级联表的级联字典表 -->
        var bumenTypesOptions = [];
        var zhiweiTypesOptions = [];

        <!-- 本表的级联字段表 -->
        var qingjiaTypesOptions = [];
        var qingjiaYesnoTypesOptions = [];

        function init() {
            // 满足条件渲染提醒接口
        }

        // 改变每页记录条数
        function changePageSize() {
            var selection = document.getElementById('selectPageSize');
            var index = selection.selectedIndex;
            pageSize = selection.options[index].value;
            getDataList();
        }



        // 查询
        function search() {
            searchForm = {key: ""};

        <!-- 级联表的级联字典表 -->
                                         
                            //职工姓名
            var zhigongNameSearchInput = $('#zhigongNameSearch');
            if( zhigongNameSearchInput != null){
                if (zhigongNameSearchInput.val() != null && zhigongNameSearchInput.val() != '') {
                    searchForm.zhigongName = $('#zhigongNameSearch').val();
                }
            }
                                                                                                     
            var bumenTypesSelectSearchInput = document.getElementById("bumenTypesSelectSearch");
            if(bumenTypesSelectSearchInput != null){
                var bumenTypesIndex = bumenTypesSelectSearchInput.selectedIndex;
                if( bumenTypesIndex  != 0){
                    searchForm.bumenTypes = document.getElementById("bumenTypesSelectSearch").options[bumenTypesIndex].value;
                }
            }
                     
            var zhiweiTypesSelectSearchInput = document.getElementById("zhiweiTypesSelectSearch");
            if(zhiweiTypesSelectSearchInput != null){
                var zhiweiTypesIndex = zhiweiTypesSelectSearchInput.selectedIndex;
                if( zhiweiTypesIndex  != 0){
                    searchForm.zhiweiTypes = document.getElementById("zhiweiTypesSelectSearch").options[zhiweiTypesIndex].value;
                }
            }
                        <!-- 本表的查询条件 -->

             
            //请假名称
            var qingjiaNameSearchInput = $('#qingjiaNameSearch');
            if( qingjiaNameSearchInput != null){
                if (qingjiaNameSearchInput.val() != null && qingjiaNameSearchInput.val() != '') {
                    searchForm.qingjiaName = $('#qingjiaNameSearch').val();
                }
            }
     
                //请假类型
            var qingjiaTypesSelectSearchInput = document.getElementById("qingjiaTypesSelectSearch");
            if(qingjiaTypesSelectSearchInput != null){
                var qingjiaTypesIndex = qingjiaTypesSelectSearchInput.selectedIndex;
                if( qingjiaTypesIndex  != 0){
                    searchForm.qingjiaTypes= document.getElementById("qingjiaTypesSelectSearch").options[qingjiaTypesIndex].value;
                }
            }
                     
                //申请状态
            var qingjiaYesnoTypesSelectSearchInput = document.getElementById("qingjiaYesnoTypesSelectSearch");
            if(qingjiaYesnoTypesSelectSearchInput != null){
                var qingjiaYesnoTypesIndex = qingjiaYesnoTypesSelectSearchInput.selectedIndex;
                if( qingjiaYesnoTypesIndex  != 0){
                    searchForm.qingjiaYesnoTypes= document.getElementById("qingjiaYesnoTypesSelectSearch").options[qingjiaYesnoTypesIndex].value;
                }
            }
                        getDataList();
        }

        // 获取数据列表
        function getDataList() {
            http("qingjia/page", "GET", {
                page: pageIndex,
                limit: pageSize,
                sort: sortColumn,
                order: sortOrder,
                qingjiaDelete: 1,
                //本表的
                qingjiaName: searchForm.qingjiaName,
                qingjiaTypes: searchForm.qingjiaTypes,
                qingjiaYesnoTypes: searchForm.qingjiaYesnoTypes,
            //级联表的
                zhigongName: searchForm.zhigongName,
                bumenTypes: searchForm.bumenTypes,
                zhiweiTypes: searchForm.zhiweiTypes,


            }, (res) => {
                if(res.code == 0) {
                    clear();
                    $("#thisTbody").html("");
                    dataList = res.data.list;
                    totalPage = res.data.totalPage;
                    for (var i = 0; i < dataList.length; i++) { //遍历一下表格数据  
                        var trow = setDataRow(dataList[i], i); //定义一个方法,返回tr数据 
                        $('#thisTbody').append(trow);
                    }
                    pagination(); //渲染翻页组件
                    getRoleButtons();// 权限按钮控制
                }
            });
        }

        // 渲染表格数据
        function setDataRow(item, number) {
            //创建行 
            var row = document.createElement('tr');
            row.setAttribute('class', 'useOnce');
            //创建勾选框
            var checkbox = document.createElement('td');
            var checkboxDiv = document.createElement('div');
            checkboxDiv.setAttribute("class", "custom-control custom-checkbox");
            var checkboxInput = document.createElement('input');
            checkboxInput.setAttribute("class", "custom-control-input");
            checkboxInput.setAttribute("type", "checkbox");
            checkboxInput.setAttribute('name', 'chk');
            checkboxInput.setAttribute('value', item.id);
            checkboxInput.setAttribute("id", number);
            checkboxDiv.appendChild(checkboxInput);
            var checkboxLabel = document.createElement('label');
            checkboxLabel.setAttribute("class", "custom-control-label");
            checkboxLabel.setAttribute("for", number);
            checkboxDiv.appendChild(checkboxLabel);
            checkbox.appendChild(checkboxDiv);
            row.appendChild(checkbox)


                    //职工姓名
            var zhigongNameCell = document.createElement('td');
            zhigongNameCell.innerHTML = item.zhigongName;
            row.appendChild(zhigongNameCell);


                    //职工手机号
            var zhigongPhoneCell = document.createElement('td');
            zhigongPhoneCell.innerHTML = item.zhigongPhone;
            row.appendChild(zhigongPhoneCell);


                //职工头像
            var zhigongPhotoCell = document.createElement('td');
            var zhigongPhotoImg = document.createElement('img');
            var zhigongPhotoImgValue = item.zhigongPhoto;
            if(zhigongPhotoImgValue !=null && zhigongPhotoImgValue !='' && zhigongPhotoImgValue !='null'){
                    zhigongPhotoImg.setAttribute('src', zhigongPhotoImgValue);
                    zhigongPhotoImg.setAttribute('height', 100);
                    zhigongPhotoImg.setAttribute('width', 100);
                    zhigongPhotoCell.appendChild(zhigongPhotoImg);
            }else{
                    zhigongPhotoCell.innerHTML = "暂无图片";
            }
            row.appendChild(zhigongPhotoCell);


            //请假名称
            var qingjiaNameCell = document.createElement('td');
            qingjiaNameCell.innerHTML = item.qingjiaName;
            row.appendChild(qingjiaNameCell);


            //请假类型
            var qingjiaTypesCell = document.createElement('td');
            qingjiaTypesCell.innerHTML = item.qingjiaValue;
            row.appendChild(qingjiaTypesCell);


            //请假开始时间
            var kaishiTimeCell = document.createElement('td');
            kaishiTimeCell.innerHTML = item.kaishiTime;
            row.appendChild(kaishiTimeCell);


            //请假结束时间
            var jieshuTimeCell = document.createElement('td');
            jieshuTimeCell.innerHTML = item.jieshuTime;
            row.appendChild(jieshuTimeCell);


            //申请时间
            var insertTimeCell = document.createElement('td');
            insertTimeCell.innerHTML = item.insertTime;
            row.appendChild(insertTimeCell);


            //申请状态
            var qingjiaYesnoTypesCell = document.createElement('td');
            qingjiaYesnoTypesCell.innerHTML = item.qingjiaYesnoValue;
            row.appendChild(qingjiaYesnoTypesCell);


            //审核理由
            var qingjiaYesnoTextCell = document.createElement('td');
            qingjiaYesnoTextCell.innerHTML = item.qingjiaYesnoText;
            row.appendChild(qingjiaYesnoTextCell);


            //审核时间
            var qingjiaShenheTimeCell = document.createElement('td');
            qingjiaShenheTimeCell.innerHTML = item.qingjiaShenheTime;
            row.appendChild(qingjiaShenheTimeCell);



            //每行按钮
            var btnGroup = document.createElement('td');

            //详情按钮
            var detailBtn = document.createElement('button');
            var detailAttr = "detail(" + item.id + ')';
            detailBtn.setAttribute("type", "button");
            detailBtn.setAttribute("class", "btn btn-info btn-sm 查看");
            detailBtn.setAttribute("onclick", detailAttr);
            detailBtn.innerHTML = "查看";
            btnGroup.appendChild(detailBtn);

            if(item.qingjiaYesnoTypes == 1){
                //审核按钮
                var yesnoBtn = document.createElement('button');
                var yesnoAttr = 'openYesnoTypes(' + item.id + ')';
                yesnoBtn.setAttribute("type", "button");
                yesnoBtn.setAttribute("class", "btn btn-warning btn-sm 审核");
                yesnoBtn.setAttribute("onclick", yesnoAttr);
                yesnoBtn.innerHTML = "审核";
                btnGroup.appendChild(yesnoBtn);
            }

            //修改按钮
            var editBtn = document.createElement('button');
            var editAttr = 'edit(' + item.id + ')';
            editBtn.setAttribute("type", "button");
            editBtn.setAttribute("class", "btn btn-warning btn-sm 修改");
            editBtn.setAttribute("onclick", editAttr);
            editBtn.innerHTML = "修改";
            btnGroup.appendChild(editBtn);



            //删除按钮
            var deleteBtn = document.createElement('button');
            var deleteAttr = 'remove(' + item.id + ')';
            deleteBtn.setAttribute("type", "button");
            deleteBtn.setAttribute("class", "btn btn-danger btn-sm 删除");
            deleteBtn.setAttribute("onclick", deleteAttr);
            deleteBtn.innerHTML = "删除";
            btnGroup.appendChild(deleteBtn);

            row.appendChild(btnGroup);

            return row;
    }


        // 翻页
        function pageNumChange(val) {
            if (val == 'pre') {
                pageIndex--;
            } else if (val == 'next') {
                pageIndex++;
            } else {
                pageIndex = val;
            }
            getDataList();
        }

        // 下载
        function download(url) {
            window.open(url);
        }
        // 打开新窗口播放媒体
        function mediaPlay(url){
            window.open(url);
        }

        // 渲染翻页组件
        function pagination() {
            var beginIndex = pageIndex;
            var endIndex = pageIndex;
            var point = 4;
            //计算页码
            for (var i = 0; i < 3; i++) {
                if (endIndex == totalPage) {
                    break;
                }
                endIndex++;
                point--;
            }
            for (var i = 0; i < 3; i++) {
                if (beginIndex == 1) {
                    break;
                }
                beginIndex--;
                point--;
            }
            if (point > 0) {
                while (point > 0) {
                    if (endIndex == totalPage) {
                        break;
                    }
                    endIndex++;
                    point--;
                }
                while (point > 0) {
                    if (beginIndex == 1) {
                        break;
                    }
                    beginIndex--;
                    point--
                }
            }
            // 是否显示 前一页 按钮
            if (pageIndex > 1) {
                $('#tableId_previous').show();
            } else {
                $('#tableId_previous').hide();
            }
            // 渲染页码按钮
            for (var i = beginIndex; i <= endIndex; i++) {
                var pageNum = document.createElement('li');
                pageNum.setAttribute('onclick', "pageNumChange(" + i + ")");
                if (pageIndex == i) {
                    pageNum.setAttribute('class', 'paginate_button page-item active useOnce');
                } else {
                    pageNum.setAttribute('class', 'paginate_button page-item useOnce');
                }
                var pageHref = document.createElement('a');
                pageHref.setAttribute('class', 'page-link');
                pageHref.setAttribute('href', '#');
                pageHref.setAttribute('aria-controls', 'tableId');
                pageHref.setAttribute('data-dt-idx', i);
                pageHref.setAttribute('tabindex', 0);
                pageHref.innerHTML = i;
                pageNum.appendChild(pageHref);
                $('#tableId_next').before(pageNum);
            }
            // 是否显示 下一页 按钮
            if (pageIndex < totalPage) {
                $('#tableId_next').show();
                $('#tableId_next a').attr('data-dt-idx', endIndex + 1);
            } else {
                $('#tableId_next').hide();
            }
            var pageNumInfo = "当前第 " + pageIndex + " 页，共 " + totalPage + " 页";
            $('#tableId_info').html(pageNumInfo);
        }

        // 跳转到指定页
        function toThatPage() {
            //var index = document.getElementById('pageIndexInput').value;
            if (index < 0 || index > totalPage) {
                alert('请输入正确的页码');
            } else {
                pageNumChange(index);
            }
        }

        // 全选/全不选
        function chooseAll() {
            checkAll = !checkAll;
            var boxs = document.getElementsByName("chk");
            for (var i = 0; i < boxs.length; i++) {
                boxs[i].checked = checkAll;
            }
        }

        // 批量删除
        function deleteMore() {
            ids = []
            var boxs = document.getElementsByName("chk");
            for (var i = 0; i < boxs.length; i++) {
                if (boxs[i].checked) {
                    ids.push(boxs[i].value)
                }
            }
            if (ids.length == 0) {
                alert('请勾选要删除的记录');
            } else {
                remove(ids);
            }
        }

        // 删除
        function remove(id) {
            var mymessage = confirm("真的要删除吗？");
            if (mymessage == true) {
                var paramArray = [];
                if (id == ids) {
                    paramArray = id;
                } else {
                    paramArray.push(id);
                }
                httpJson("qingjia/delete", "POST", paramArray, (res) => {
                    if(res.code == 0){
                        getDataList();
                        alert('删除成功');
                    }
                });
            } else {
                alert("已取消操作");
            }
        }

        // 用户登出
        <%@ include file="../../static/logout.jsp"%>

        //修改
        function edit(id) {
            window.sessionStorage.setItem('updateId', id)
            window.location.href = "add-or-update.jsp"
        }

        //清除会重复渲染的节点
        function clear() {
            var elements = document.getElementsByClassName('useOnce');
            for (var i = elements.length - 1; i >= 0; i--) {
                elements[i].parentNode.removeChild(elements[i]);
            }
        }

        //添加
        function add() {
            window.sessionStorage.setItem("addqingjia", "addqingjia");
            window.location.href = "add-or-update.jsp"
        }

        //报表
        function graph() {
            window.location.href = "graph.jsp"
        }
        function exportExcel() {
            excel = new ExcelGen({
                "src_id": "tableId",
                "show_header": true,
                "file_name": 'qingjia.xlsx'
            });
            excel.generate();
        }

        // 查看详情
        function detail(id) {
            window.sessionStorage.setItem("updateId", id);
            window.location.href = "info.jsp";
        }


    //填充级联表搜索下拉框
                                         
                                                                                                     
        function bumenTypesSelectSearch() {
            var bumenTypesSelectSearch = document.getElementById('bumenTypesSelectSearch');
            if(bumenTypesSelectSearch != null) {
                bumenTypesSelectSearch.add(new Option('-请选择-',''));
                if (bumenTypesOptions != null && bumenTypesOptions.length > 0){
                    for (var i = 0; i < bumenTypesOptions.length; i++) {
                            bumenTypesSelectSearch.add(new Option(bumenTypesOptions[i].indexName, bumenTypesOptions[i].codeIndex));
                    }
                }
            }
        }
                     
        function zhiweiTypesSelectSearch() {
            var zhiweiTypesSelectSearch = document.getElementById('zhiweiTypesSelectSearch');
            if(zhiweiTypesSelectSearch != null) {
                zhiweiTypesSelectSearch.add(new Option('-请选择-',''));
                if (zhiweiTypesOptions != null && zhiweiTypesOptions.length > 0){
                    for (var i = 0; i < zhiweiTypesOptions.length; i++) {
                            zhiweiTypesSelectSearch.add(new Option(zhiweiTypesOptions[i].indexName, zhiweiTypesOptions[i].codeIndex));
                    }
                }
            }
        }
                    
    //填充本表搜索下拉框
             
     
        function qingjiaTypesSelectSearch() {
            var qingjiaTypesSelectSearch = document.getElementById('qingjiaTypesSelectSearch');
            if(qingjiaTypesSelectSearch != null) {
                qingjiaTypesSelectSearch.add(new Option('-请选择-',''));
                if (qingjiaTypesOptions != null && qingjiaTypesOptions.length > 0){
                    for (var i = 0; i < qingjiaTypesOptions.length; i++) {
                            qingjiaTypesSelectSearch.add(new Option(qingjiaTypesOptions[i].indexName,qingjiaTypesOptions[i].codeIndex));
                    }
                }
            }
        }
                     
        function qingjiaYesnoTypesSelectSearch() {
            var qingjiaYesnoTypesSelectSearch = document.getElementById('qingjiaYesnoTypesSelectSearch');
            if(qingjiaYesnoTypesSelectSearch != null) {
                qingjiaYesnoTypesSelectSearch.add(new Option('-请选择-',''));
                if (qingjiaYesnoTypesOptions != null && qingjiaYesnoTypesOptions.length > 0){
                    for (var i = 0; i < qingjiaYesnoTypesOptions.length; i++) {
                            qingjiaYesnoTypesSelectSearch.add(new Option(qingjiaYesnoTypesOptions[i].indexName,qingjiaYesnoTypesOptions[i].codeIndex));
                    }
                }
            }
        }
            
    //查询级联表搜索条件所有列表
            function bumenTypesSelect() {
                //填充下拉框选项
                http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=bumen_types", "GET", {}, (res) => {
                    if(res.code == 0){
                        bumenTypesOptions = res.data.list;
                    }
                });
            }
            function zhiweiTypesSelect() {
                //填充下拉框选项
                http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=zhiwei_types", "GET", {}, (res) => {
                    if(res.code == 0){
                        zhiweiTypesOptions = res.data.list;
                    }
                });
            }

    //查询当前表搜索条件所有列表
            function qingjiaTypesSelect() {
                //填充下拉框选项
                http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=qingjia_types", "GET", {}, (res) => {
                    if(res.code == 0){
                        qingjiaTypesOptions = res.data.list;
                    }
                });
            }
            function qingjiaYesnoTypesSelect() {
                //填充下拉框选项
                http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=qingjia_yesno_types", "GET", {}, (res) => {
                    if(res.code == 0){
                        qingjiaYesnoTypesOptions = res.data.list;
                    }
                });
            }










            function openYesnoTypes(id) {
                $("#qingjiaYesnoTypesId").val(id)
                $('#qingjiaYesnoTypesModal').modal('show');
            }

            function qingjiaYesnoTypesShenhe() {
                var mymessage = confirm("真的要确定这个审核结果吗？");
                if (mymessage == true) {
                    let data = {};
                    data["id"] = $("#qingjiaYesnoTypesId").val();
                    if($("#qingjiaYesnoTypes option:selected").val() == 2 || $("#qingjiaYesnoTypes option:selected").val() ==3){
                        data["qingjiaYesnoTypes"] = $("#qingjiaYesnoTypes option:selected").val();//获取选中的审核结果
                    }else{
                        alert("请选择审核结果")
                        return false;
                    }
                    data["qingjiaYesnoText"] = $("#qingjiaYesnoText").val();
                    httpJson("qingjia/shenhe", "POST", data, (res) => {
                        if(res.code == 0){
                            alert('审核成功');
                            getDataList();
                        }else{
                            alert('审核失败');
                        }
                        $('#qingjiaYesnoTypesModal').modal('hide');
                        $("#qingjiaYesnoTypes").val(1);
                        $("#qingjiaYesnoTypesId").val(null);
                        $("#qingjiaYesnoText").val(null);
                    });
                }else {
                    $('#qingjiaYesnoTypesModal').modal('hide');
                    $("#qingjiaYesnoTypes").val(1);
                    $("#qingjiaYesnoTypesId").val(null);
                    $("#qingjiaYesnoText").val(null);
                    alert("已取消操作");
                }
            }

        layui.use(['layer', 'carousel', 'jquery', 'form', 'upload', 'laydate', 'rate'], function () {
            var rate = layui.rate;//评分
            var jquery = layui.jquery;//jquery
            var $=jquery;

        });


        $(document).ready(function () {
            //激活翻页按钮
            $('#tableId_previous').attr('class', 'paginate_button page-item previous')
            $('#tableId_next').attr('class', 'paginate_button page-item next')
            //隐藏原生搜索框
            $('#tableId_filter').hide()
            //设置右上角用户名
            $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
            //设置项目名
            $('.sidebar-header h3 a').html(projectName)
            setMenu();
            init();

            //查询级联表的搜索下拉框
            bumenTypesSelect();
            zhiweiTypesSelect();

            //查询当前表的搜索下拉框
            qingjiaTypesSelect();
            qingjiaYesnoTypesSelect();
            getDataList();

        //级联表的下拉框赋值
                                                 
                                                                                                                         
            bumenTypesSelectSearch();
                         
            zhiweiTypesSelectSearch();
                        
        //当前表的下拉框赋值
                                     
             
            qingjiaTypesSelectSearch();
                                                             
            qingjiaYesnoTypesSelectSearch();
                                    
        <%@ include file="../../static/myInfo.js"%>
    });
</script>
</body>

</html>
