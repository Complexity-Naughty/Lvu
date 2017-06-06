<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>PicScroll</title>
    <style type="text/css">
    #body #box {    	
        width: 100%;
        height: 400px;
        overflow: hidden;
    }
    #body #box #bottom #pic .button li {
        height: 10px;
        width: 10px;
        float: left;/*让列表浮动实现横排列表*/
        border: 1px solid #fff;/*让边框成为1像素 实线 白色*/
        list-style-type: none;/*去掉列表自带的小圆点*/
        margin-right: 3px;/*右边留白3像素 实线圆形按钮的间距*/
        border-radius: 5px;/*用边框半径 实现圆形框*/
    }
    #body #box #bottom #pic .button {
        height: 12px;
        width: 135px;/*宽度按照小圆圈按钮总和+padding算总和*/
        border-radius: 14px;/*给一个半径，让按钮呈现椭圆形*/
        background-color: rgba(0,0,0,0.5);/*background-color: rgba(0,0,0,0.5); 表示0,0,0,三个基色,透明度0.5*/
        position: absolute;/*绝对定位，让按钮固定在轮播图片下方*/
        left: 485px;/*绝对定位*/
        top: 455px;/*绝对定位*/
        padding-top: 5px;/*内边距固定小圆圈位置*/
        padding-right: 15px;/*内边距固定小圆圈位置*/
        padding-bottom: 5px;/*内边距固定小圆圈位置*/
        padding-left: 15px;
    }
    #pic ul li.hover {
        background: #3F6;/*这个是鼠标指向按钮的颜色*/
    }
    a:hover {
        color: rgba(153,153,153,1);
        font-style: italic;
    }
    a:active {
        color: rgba(255,0,0,1);
    }
    a {
        text-decoration: none;
    }
    </style>
</head>
<body id="body">
    <div class="box" id="box">
        <div class="bottom" id="bottom">
            <div class="pic" id="pic">
    
              <img src="images-scroll/scenery1.jpg"  width="809" height="500"/>
              <img src="images-scroll/scenery2.jpg"  width="809" height="500"/>
              <img src="images-scroll/scenery3.jpg"  width="809" height="500"/>
              <img src="images-scroll/scenery4.jpg"  width="809" height="500"/> 
              <img src="images-scroll/scenery5.jpg"  width="809" height="500"/>
              
              <img src="images-scroll/scenery6.jpg"  width="809" height="500"/>
              <img src="images-scroll/scenery8.jpg"  width="809" height="500"/>
              <img src="images-scroll/vegetation.jpg"  width="809" height="500"/>
              <img src="images-scroll/vegetation2.jpg"  width="809" height="500"/>
              <!--插入多张在轮播的图片--> 
    
                <ul class="button">
                    <!--让按钮带上序列号，实现与图片的一一对应-->
                    <li class="hover"></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <!--添加跟图片等量的列表，一一对应-->
                </ul>
            </div>
            <script type="text/javascript" src="js/jquery-1.6.js"></script> 
            <script type="text/javascript">
                //指针指向显示图片
                var index=0;//初始化序列号
                var Play=null;
                $(".button li").mouseover(function(){
                    clearInterval(Play);//清除定时器
                    index=$(this).index();//获取序列号实现按序列号对应图片
                    //alert(index);//界面中显示序列号
                    $(this).addClass("hover").siblings().removeClass("hover");
                    $(".pic img").eq(index).show().siblings("img").hide();
                }).mouseout(function(){
                    autoPlay()
                });
    
                //---图片自动轮播效果---
                
                function autoPlay(){
                    //设置定时器
                    Play=setInterval(function(){
                        //alert("我是定时器")//界面显示示例
                        index++;
                        if(index>8)
                            {index=-1;}/*设置成-1，是因为上面index会++*/
                        else
                    //alert(index);//界面中显示序列号
                $(".button li").eq(index).addClass("hover").siblings().removeClass("hover");
                $(".pic img").eq(index).show().siblings("img").hide();  
                        },1000);//定时器函数，2000表示2000毫秒执行一次
                }
                autoPlay();
            </script> 
        </div>
    </div>
</body>
</html>