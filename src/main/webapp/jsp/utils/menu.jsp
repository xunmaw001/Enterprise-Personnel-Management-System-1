<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
var menus = [

	{
        "backMenu":[
            {
                "child":[
                    {
                        "buttons":[
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"轮播图管理",
                        "menuJump":"列表",
                        "tableName":"config"
                    }
                ],
                "menu":"轮播图信息"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"打卡管理",
                        "menuJump":"列表",
                        "tableName":"daka"
                    }
                ],
                "menu":"打卡管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "新增",
                            "删除",
                            "修改"
                        ],
                        "menu":"部门管理",
                        "menuJump":"列表",
                        "tableName":"dictionaryBumen"
                    }
                    ,
                    {
                        "buttons":[
                            "新增",
                            "删除",
                            "修改"
                        ],
                        "menu":"公告类型管理",
                        "menuJump":"列表",
                        "tableName":"dictionaryGonggao"
                    }
                    ,
                    {
                        "buttons":[
                            "新增",
                            "删除",
                            "修改"
                        ],
                        "menu":"奖金类型管理",
                        "menuJump":"列表",
                        "tableName":"dictionaryJiangjin"
                    }
                    ,
                    {
                        "buttons":[
                            "新增",
                            "删除",
                            "修改"
                        ],
                        "menu":"培训计划类型管理",
                        "menuJump":"列表",
                        "tableName":"dictionaryPeixunjihua"
                    }
                    ,
                    {
                        "buttons":[
                            "新增",
                            "删除",
                            "修改"
                        ],
                        "menu":"请假类型管理",
                        "menuJump":"列表",
                        "tableName":"dictionaryQingjia"
                    }
                    ,
                    {
                        "buttons":[
                            "新增",
                            "删除",
                            "修改"
                        ],
                        "menu":"任务类型管理",
                        "menuJump":"列表",
                        "tableName":"dictionaryRenwu"
                    }
                    ,
                    {
                        "buttons":[
                            "新增",
                            "删除",
                            "修改"
                        ],
                        "menu":"友情链接类型管理",
                        "menuJump":"列表",
                        "tableName":"dictionaryYouqinglianjie"
                    }
                    ,
                    {
                        "buttons":[
                            "新增",
                            "删除",
                            "修改"
                        ],
                        "menu":"招聘计划类型管理",
                        "menuJump":"列表",
                        "tableName":"dictionaryZhaopinjihua"
                    }
                ],
                "menu":"基础数据管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"公告管理",
                        "menuJump":"列表",
                        "tableName":"gonggao"
                    }
                ],
                "menu":"公告管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"奖金管理",
                        "menuJump":"列表",
                        "tableName":"jiangjin"
                    }
                ],
                "menu":"奖金管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"留言板管理",
                        "menuJump":"列表",
                        "tableName":"liuyan"
                    }
                ],
                "menu":"留言板管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"培训计划管理",
                        "menuJump":"列表",
                        "tableName":"peixunjihua"
                    }
                ],
                "menu":"培训计划管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "审核",
                            "删除"
                        ],
                        "menu":"请假管理",
                        "menuJump":"列表",
                        "tableName":"qingjia"
                    }
                ],
                "menu":"请假管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"任务管理",
                        "menuJump":"列表",
                        "tableName":"renwu"
                    }
                ],
                "menu":"任务管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"单页数据管理",
                        "menuJump":"列表",
                        "tableName":"singleSeach"
                    }
                ],
                "menu":"单页数据管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"薪资管理",
                        "menuJump":"列表",
                        "tableName":"xinzi"
                    }
                ],
                "menu":"薪资管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"友情链接管理",
                        "menuJump":"列表",
                        "tableName":"youqinglianjie"
                    }
                ],
                "menu":"友情链接管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"招聘计划管理",
                        "menuJump":"列表",
                        "tableName":"zhaopinjihua"
                    }
                ],
                "menu":"招聘计划管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "报表",
                            "新增",
                            "修改",
                            "删除"
                        ],
                        "menu":"职工管理",
                        "menuJump":"列表",
                        "tableName":"zhigong"
                    }
                ],
                "menu":"职工管理"
            }
        ],
        "frontMenu":[

        ],
        "roleName":"管理员",
        "tableName":"users"
    }
	,
	{
        "backMenu":[
            {
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "新增",
                            "删除"
                        ],
                        "menu":"打卡管理",
                        "menuJump":"列表",
                        "tableName":"daka"
                    }
                ],
                "menu":"打卡管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看"
                        ],
                        "menu":"公告管理",
                        "menuJump":"列表",
                        "tableName":"gonggao"
                    }
                ],
                "menu":"公告管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看"
                        ],
                        "menu":"奖金管理",
                        "menuJump":"列表",
                        "tableName":"jiangjin"
                    }
                ],
                "menu":"奖金管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看"
                        ],
                        "menu":"留言板管理",
                        "menuJump":"列表",
                        "tableName":"liuyan"
                    }
                ],
                "menu":"留言板管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看"
                        ],
                        "menu":"培训计划管理",
                        "menuJump":"列表",
                        "tableName":"peixunjihua"
                    }
                ],
                "menu":"培训计划管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看",
                            "新增",
                            "删除"
                        ],
                        "menu":"请假管理",
                        "menuJump":"列表",
                        "tableName":"qingjia"
                    }
                ],
                "menu":"请假管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看"
                        ],
                        "menu":"任务管理",
                        "menuJump":"列表",
                        "tableName":"renwu"
                    }
                ],
                "menu":"任务管理"
            }
            ,{
                "child":[
                    {
                        "buttons":[
                            "查看"
                        ],
                        "menu":"薪资管理",
                        "menuJump":"列表",
                        "tableName":"xinzi"
                    }
                ],
                "menu":"薪资管理"
            }
        ],
        "frontMenu":[

        ],
        "roleName":"职工",
        "tableName":"zhigong"
    }
];

var hasMessage = '';
