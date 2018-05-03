<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="css/test.css" />

<title>Insert title here</title>


<script>
var cartTable = document.getElementById('cartTable');
var tr = cartTable.children[1].rows;//获取table下的tbody下的每一行
var checkInputs = document.getElementsByClassName('check');
var checkAllInputs = document.getElementsByClassName('check-all');
var selectedTotal = document.getElementById('selectedTotal');
var priceTotal = document.getElementById('priceTotal');
//计算总数和价格
function getTotal(){
    var selected = 0;
    var price = 0;
    for(var i=0;i < tr.length; i++){
        if(tr[i].getElementsByTagName('input')[0].checked){
            selected += parseInt(tr[i].getElementsByTagName('input')[1].value);
            price += parseFloat(tr[i].cells[4].innerHTML);//cells属性为获得tr下面的td
        }
    }
    selectedTotal.innerHTML = selected;
    priceTotal.innerHTML = price.toFixed(2);//保留两位小数
}
for(var i=0;i<checkInputs.length;i++){
    checkInputs[i].onclick = function(){
        if(this.className === 'check-all check'){//如果点击的是全选按钮，则使所有按钮的状态和它相同
            for(var j=0;j<checkInputs.length;j++){
                checkInputs[j].checked = this.checked;
            }
        }
        if(this.checked == false){//如果其中一个变为未选中状态，则使全选按钮取消选中
            for(var i=0;i<checkAllInputs.length;i++){
                checkAllInputs[i].checked = false;
            }
        }
        getTotal();
    }
}

function getTotal(){
    var selected = 0;
    var price = 0;
    var HTMLstr = '';
    for(var i=0;i < tr.length; i++){
        if(tr[i].getElementsByTagName('input')[0].checked){
            tr[i].className = 'on';
            selected += parseInt(tr[i].getElementsByTagName('input')[1].value);
            price += parseFloat(tr[i].cells[4].innerHTML);//cells属性为获得tr下面的td
            HTMLstr += '<div><img src="'+ tr[i].getElementsByTagName('img')[0].src + '"><span>取消选择</span></div>';
        }
        else{
            tr[i].className = '';
        }
    }
    selectedTotal.innerHTML = selected;
    priceTotal.innerHTML = price.toFixed(2);//保留两位小数
    selectedViewList.innerHTML = HTMLstr;
    if(selected == 0){
        foot.className = 'foot';
    }
}
for(var i=0;i<checkInputs.length;i++){
    checkInputs[i].onclick = function(){
        if(this.className === 'check-all check'){//如果点击的是全选按钮，则使所有按钮的状态和它相同
            for(var j=0;j<checkInputs.length;j++){
                checkInputs[j].checked = this.checked;
            }
        }
        if(this.checked == false){//如果其中一个变为未选中状态，则使全选按钮取消选中
            for(var i=0;i<checkAllInputs.length;i++){
                checkAllInputs[i].checked = false;
            }
        }
        getTotal();
    }
}

selected.onclick = function(){
    if(foot.className == 'foot'){
        if(selectedTotal.innerHTML != 0){
            foot.className = 'foot show';
        }
    }else{
        foot.className = 'foot';
    }
}

selectedViewList.onclick = function(e){
    var el = e.srcElement;
    if(el.className == 'del'){
        var index = el.getAttribute('index');
        var input = tr[index].getElementsByTagName('input')[0];
        input.checked = false;
        input.onclick();
    }
}

//增减商品数量事件代理
for(var i=0;i<tr.length;i++){
    tr[i].onclick = function(e){
        e = e|| window.event;
        var el = e.srcElement;
        var cls = el.className;
        var input = this.getElementsByTagName('input')[1];
        var val = parseInt(input.value);
        var reduce = this.getElementsByTagName('span')[1];
        switch (cls){
            case 'add':
                input.value = val + 1;
                reduce.innerHTML = '-';
                    getsubTotal(this);
                break;
            case 'reduce':
                if(val > 1){
                    input.value = val - 1;
                    getsubTotal(this);
                }else{
                    reduce.innerHTML = '';
                }
        }
        getTotal();
    }
    tr[i].getElementsByTagName('input')[1].onkeyup = function(){
        var val = parseInt(this.value);
        var tr = this.parentNode.parentNode;//this指的是当前的input，其父节点的父节点就是当前的tr
        var reduce = tr.getElementsByTagName('span')[1];
        if(isNaN(val) || val < 1){
            val = 1;
        }
        this.value = val;//保证输入框中都是大于1的纯数字
        if(val <= 1){
            reduce.innerHTML = '';
        }
       else{
            reduce.innerHTML = '-';
        }
        getsubTotal(tr);
        getTotal();
    }
}

//删除商品
deleteAll.onclick = function(){
    if(selectedTotal.innerHTML != '0'){
        var conf = confirm("确定要删除所选商品吗");
        if(conf){
            for(var i=0;i<tr.length;i++){
                var input = tr[i].getElementsByTagName('input')[0];
                if(input.checked){
                    tr[i].parentNode.removeChild(tr[i]);
                    i --;//因为删除数组中的一个后，后面的索引就会向前移，此时要让i也向前移一个，回置下标i
                }
            }
            getTotal();
        }
    }
}
</script>
</head>
<body>
	<table id="cartTable">
    <thead>
        <tr>
           <th><label><input class="check-all check" type="checkbox"/>&nbsp;全选</label></th>
            <th>商品</th>
            <th>单价</th>
            <th>数量</th>
            <th>小计</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="checkbox"><input class="check-one check" type="checkbox" /></td>
            <td class="goods"><img src="images/1.jpg" alt="" /><span>Casio/卡西欧 EX-TR350</span></td>
            <td class="price">5999.88</td>
            <td class="count"><span class="reduce"></span><input class="count-input" type="text" value="1"/><span class="add">+</span></td>
            <td class="subtotal">5999.88</td>
            <td class="operation"><span class="delete">删除</span></td>
        </tr>
        <tr>
            <td class="checkbox"><input class="check-one check" type="checkbox" /></td>
            <td class="goods"><img src="images/2.jpg" alt="" /><span>Canon/佳能 PowerShot SX50 HS</span></td>
            <td class="price">3888.50</td>
            <td class="count"><span class="reduce"></span><input class="count-input" type="text" value="1"/><span class="add">+</span></td>
            <td class="subtotal">3888.50</td>
            <td class="operation"><span class="delete">删除</span></td>
        </tr>
        <tr>
            <td class="checkbox"><input class="check-one check" type="checkbox" /></td>
            <td class="goods"><img src="images/3.jpg" alt="" /><span>Sony/索尼 DSC-WX300</span></td>
            <td class="price">1428.50</td>
            <td class="count"><span class="reduce"></span><input class="count-input" type="text" value="1"/><span class="add">+</span></td>
            <td class="subtotal">1428.50</td>
            <td class="operation"><span class="delete">删除</span></td>
        </tr>
        <tr>
            <td class="checkbox"><input class="check-one check" type="checkbox" /></td>
            <td class="goods"><img src="images/4.jpg" alt="" /><span>Fujifilm/富士 instax mini 25</span></td>
            <td class="price">640.60</td>
            <td class="count"><span class="reduce"></span><input class="count-input" type="text" value="1"/><span class="add">+</span></td>
            <td class="subtotal">640.60</td>
            <td class="operation"><span class="delete">删除</span></td>
        </tr>
    </tbody>
</table>
<div class="foot" id="foot">
    <label class=" fl select-all"><input type="checkbox" class="check-all check" />&nbsp;全选</label>
    <a class="fl delete" id="deleteAll" href="javascript:;">删除</a>
    <div class="fr closing">结 算</div>
    <div class="fr total">合计：￥<span id="priceTotal">0.00</span></div>
    <div class="fr select" id="selected">已选商品<span id="selectedTotal">0</span>件<span class="arrow up">︽</span><span class="arrow down">︾</span></div>
    <div class="selected-view">
        <div id="selectedViewList" class="clearfix">
            <div><img src="images/1.jpg"><span>取消选择</span></div>
        </div>
        <span class="arrow">◆<span>◆</span></span>
    </div>
</div>


</body>
</html>