<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>购物车</title>
    <script src="js/test1.js"></script>
    <link rel="stylesheet" href="css/test1.css">
</head>
<body>
    <table>
        <thead>
            <tr>
                <th class="tdone">序号</th>
                <th class="tdtwo">商品名称</th>
                <th class="tdthree">数量</th>
                <th class="tdfour">单价</th>
                <th class="tdfive">小计</th>
                <th class="tdsix">操作</th>
            </tr>
        </thead>
        <tbody>
            <tr class="trclass">
                <td class="tdone xuhao">1</td>
                <td class="tdtwo ">烤煎饼</td>
                <td class="tdthree"><span class="jiajie"><input type="button" value="-"><span class="num">0</span><input type="button" value="+"></span></td>
                <td class="tdfour"><span>单价：</span><span class="unit">2</span></td>
                <td class="tdfive"><span>小计：</span><span class="subtal">0</span></td>
                <td class="tdsix"><button class="del">删除</button></td>
            </tr>
              <tr class="trclass">
                <td class="tdone xuhao">2</td>
                <td class="tdtwo">珍珠奶茶</td>
                <td class="tdthree"><span class="jiajie"><input type="button" value="-"><span class="num">0</span><input type="button" value="+"></span></td>
                <td class="tdfour"><span>单价：</span><span class="unit">3.5</span></td>
                <td class="tdfive"><span>小计：</span><span class="subtal">0</span></td>
                <td class="tdsix"><button class="del">删除</button></td>
            </tr>
              <tr class="trclass">
                <td class="tdone xuhao">3</td>
                <td class="tdtwo">羊肉串</td>
                <td class="tdthree"><span class="jiajie"><input type="button" value="-"><span class="num">0</span><input type="button" value="+"></span></td>
                <td class="tdfour"><span>单价：</span><span class="unit">1.5</span></td>
                <td class="tdfive"><span>小计：</span><span class="subtal">0</span></td>
                <td class="tdsix"><button class="del">删除</button></td>
            </tr>
              <tr>
                <td class="tdone xuhao">4</td>
                <td class="tdtwo">牛肉</td>
                <td class="tdthree"><span class="jiajie"><input type="button" value="-"><span class="num">0</span><input type="button" value="+"></span></td>
                <td class="tdfour"><span>单价：</span><span class="unit">10</span></td>
                <td class="tdfive"><span>小计：</span><span class="subtal">0</span></td>
                <td class="tdsix"><button class="del">删除</button></td>
            </tr>
              <tr class="trclass">
                <td class="tdone xuhao">5</td>
                <td class="tdtwo">烧刀子</td>
                <td class="tdthree"><span class="jiajie"><input type="button" value="-"><span class="num">0</span><input type="button" value="+"></span></td>
                <td class="tdfour"><span>单价：</span><span class="unit">1.8</span></td>
                <td class="tdfive"><span>小计：</span><span class="subtal">0</span></td>
                <td class="tdsix"><button class="del">删除</button></td>
            </tr>
             <tr class="trclass">
                <td class="tdone xuhao">6</td>
                <td class="tdtwo">水煮鱼</td>
                <td class="tdthree"><span class="jiajie"><input type="button" value="-"><span class="num">0</span><input type="button" value="+"></span></td>
                <td class="tdfour"><span>单价：</span><span class="unit">15</span></td>
                <td class="tdfive"><span>小计：</span><span class="subtal">0</span></td>
                <td class="tdsix"><button class="del">删除</button></td>
            </tr>
             <tr class="trclass">
                <td class="tdone xuhao">7</td>
                <td class="tdtwo">花生米</td>
                <td class="tdthree"><span class="jiajie"><input type="button" value="-"><span class="num">0</span><input type="button" value="+"></span></td>
                <td class="tdfour"><span>单价：</span><span class="unit">3</span></td>
                <td class="tdfive"><span>小计：</span><span class="subtal">0</span></td>
                <td class="tdsix"><button class="del">删除</button></td>
            </tr>
            <tr><td   colspan="6" class="talast"><span>商品一共 <span class="goods_num">0</span> 件; 共计花费 <span class="pricetal">0</span> 元; 其中最贵的商品单价是 <span class="pricest">0</span> 元</span></td></tr>
        </tbody>
    </table>
</body>
</html> 