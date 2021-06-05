package utils;

import java.util.HashMap;

import pojo.Decorations;

public class ShopCar {
	
	//request是jsp得内置对象，Java里并不能使用，而request本质就是获取参数，所以我们选择传参得方式
	//添加购物车
   public void addItem(String action,String DecorationsNo,HashMap<String, Decorations> DecorationsCar,HashMap<String, Decorations> dec) {
	   if (action == null)
			action = "";

		if (action.equals("buy")) { //购买商品,
			//点击加入购物车，对应饰品action即为buy同时传入饰品的编号decNo=<%=entry.getKey()%
			/* String DecorationsNo = request.getParameter("decNo"); */
			Decorations temp = (Decorations) DecorationsCar.get(DecorationsNo);
			if (temp == null) {
				//如果 car 中不存在该商品
				temp = (Decorations)dec.get(DecorationsNo);
				temp.setBuyNum(1);
				DecorationsCar.put(DecorationsNo, temp);
			} else { //如果 car 中存在该商品，购买数量加 1 
				temp.setBuyNum(temp.getBuyNum() + 1);
			     DecorationsCar.put(DecorationsNo, temp);
			}
		}
   }
		//移除购物车
		public void removeItem(String DecorationsNo,HashMap<String, Decorations> DecorationsCar) {
		//String DecorationsNo = request.getParameter("decNo");
		DecorationsCar.remove(DecorationsNo);
		
		}
		//批量删除
		public void minuItem(String[] decNos,HashMap<String, Decorations> DecorationsCar) {
			//String[] decNos = request.getParameterValues("checkOne");//获取所有勾选了的复选框的值，并以数组返回
			 if(decNos.length>0){
				 for(int i=0;i<decNos.length;i++){//遍历数组中全部的值，逐一删除
					 DecorationsCar.remove(decNos[i]);
				 }
			
		}
		}
}
		
   

