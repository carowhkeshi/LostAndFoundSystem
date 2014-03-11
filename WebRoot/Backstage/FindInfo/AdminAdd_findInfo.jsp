<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>管理员添加招领信息</title>

<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>

	<script type="text/javascript">
	
		function check(form)
		{
		    var find_name=form.find_name.value;
		    var find_type_id=form.find_type.value;
		    var find_time=form.find_time.value;
		    var find_place=form.find_place.value;
		    var contact_name=form.contact_name.value;
		    var contact_mobile=form.contact_mobile.value;
		    var contact_email=form.contact_email.value;
		    var contact_qq=form.contact_qq.value;
		    var find_detail_info=form.find_detail_info.value;
		    if(isStrNull(find_name)==0)
		    {
		    	alert("请输入物品名称");
		    	return false;
		    }
		    if(isStrNull(find_type_id)==0)
		    {
		    	alert("请选择物品类型");
		    	return false;
		    }
		    if(isStrNull(find_place)==0)
		    {
		    	alert("请输入拾到地点");
		    	return false;
		    }
		    if(isStrNull(find_time)==0)
		    {
		    	alert("请输入拾到时间");
		    	return false;
		    }
		    if(isStrNull(contact_name)==0)
		    {
		    	alert("请输入联系人姓名");
		    	return false;
		    }
		
		    //校验手机，qq,email,
		    if(contact_mobile!="")
		    {
		        if(!IsTelephone(contact_mobile))
		        {
		        	alert("电话号码格式不正确");
		            return false;
		        }
		    }
		    if(contact_qq!="")
		    {
		        if(!isqq(contact_qq))
		        {
		        	alert("qq号码格式不正确");
		            return false;
		        }
		
		    }
		    if(contact_email!="")
		    {
		        if(!isemail(contact_email))
		        {
		        	alert("邮箱格式不正确");
		            return false;
		        }
		
		    }
		    if(isStrNull(find_detail_info)==0)
		    {
		    	alert("请输入信息详情");
		    	return false;
		    }
		    if(isStrNull(contact_email)==0&&isStrNull(contact_qq)==0&&isStrNull(contact_mobile)==0)
		    {
		    	alert("请输入至少一项联系方式");
		    	return false;
		    }
		    return true;
		
		}
		
		function isStrNull(msg) {
		var mystr = msg;
		while ((mystr.indexOf(" ") == 0) && (mystr.length > 1)) {
		    mystr = mystr.substring(1, mystr.length);
		}
		if (mystr == " ") {
		    mystr = "";
		}
		if (msg == null || mystr == "" || mystr == 0) {
		    return 0;
		} else {
		    return 1;
		}
		}
		//判断输入是否是有效的电子邮件 
		function isemail(str) 
		{ 
			var result=str.match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/); 
			if(result==null) 
				return false; 
			return true; 
		} 
		//匹配腾讯QQ号 
		function isqq(str) 
		{ 
			var result=str.match(/[1-9][0-9]{4,}/); 
			if(result==null) 
				return false; 
			return true; 
		} 
		  function IsTelephone(obj)// 正则判断
		  { 
		
			  var pattern = /^1[3,5]\d{9}$/;
			if(pattern.test(obj)) 
				{ 
				return true; 
				} 
			else 
				{ 
				return false; 
				} 
			} 
		
	</script>
</head>

<body style="background-color:#dcfab3;">
	<div style="margin:0 auto;width:538px;height:20px;background-color:#0290fd;border:1px solid #0290fd;"><font style="margin:0 0 0 2px;font-family:黑体;font-size:15px;" color="#FFFFFF">添加招领信息</font><font style="margin:0 0 0 140px;" color="red">*</font><font style="font-size:13px;" color="yellow">号为必填</font></div>
	<form action="AdminAddFindinfo.action" method="post" onsubmit="return check(this);">
	<table align="center" width=540px bgcolor="#90dad9" style="table-layout: fixed;">
	<tr>
		<td style="font-family:宋体;font-size:15px;width:150px;">物品名称:</td>
		<td><input type="text" name="find_name" value="U盘" /><font color="red">*</font></td>
	</tr>
	
	<tr>
	<td style="font-family:宋体;font-size:15px;width:150px;">物品类型:</td>
	<td>
		<select size="1" name="find_type">
			<option selected="selected" value="">--请选择--</option>
			<c:forEach items="${requestScope.allItype}" var="itype">
				<option value="${itype.type_name}">${itype.type_name}</option>
			</c:forEach>
		</select>
	<font color="red">*</font>
	</td>
	</tr>
	
	<tr>
		<td style="font-family:宋体;font-size:15px;width:150px;">拾到地点:</td>
		<td><input type="text" name="find_place" value="E1A-406" /><font color="red">*</font></td>
	</tr>
	
	<tr>
		<td style="font-family:宋体;font-size:15px;width:150px;">拾到时间:</td>
		<td>
			<input id="my_find_time" type="text"  onclick="WdatePicker()" name="find_time" class="add_time mt10 mb5" />
			<img style="margin:0px auto;" onclick="WdatePicker({el:'my_find_time'})" src="js/My97DatePicker/skin/datePicker.gif" width="16" height="22">
			<font color="red">*</font>
		</td>
	</tr>
	
	
	<tr>
		<td style="font-family:宋体;font-size:15px;width:150px;">联系人:</td>
		<td><input type="text" name="contact_name" value="测试1" /><font color="red">*</font></td>
	</tr>
	
	
	<tr>
		<td style="font-family:宋体;font-size:15px;width:150px;">联系人手机(选填):</td>
		<td><input type="text" name="contact_mobile" value="15268980986" /></td>
	</tr>
	
	<tr>
		<td style="font-family:宋体;font-size:15px;width:150px;">联系人邮箱(选填):</td>
		<td><input type="text" name="contact_email" value="ceshi1@163.com" /></td>
	</tr>
	
	<tr>
		<td style="font-family:宋体;font-size:15px;width:150px;">联系人qq(选填):</td>
		<td><input type="text" name="contact_qq" value="98989833" /></td>
	</tr>
	
	<tr>
		<td style="font-family:宋体;font-size:15px;width:150px;">详情描述:</td>
		<td><textarea name="find_detail_info" style="resize:none;" rows="13" cols="40">爱国者aigo牌的，有4G</textarea>
		<font color="red">*</font></td>
	</tr>
	
	<tr>
		<td></td>
		<td>
			<input style="margin:0 0 0 50px;" type="submit" value="添加"/>
			<input style="margin:0 0 0 30px;" type="reset" value="重置"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>