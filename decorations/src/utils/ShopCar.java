package utils;

import java.util.HashMap;

import pojo.Decorations;

public class ShopCar {
	
	//request��jsp�����ö���Java�ﲢ����ʹ�ã���request���ʾ��ǻ�ȡ��������������ѡ�񴫲ε÷�ʽ
	//��ӹ��ﳵ
   public void addItem(String action,String DecorationsNo,HashMap<String, Decorations> DecorationsCar,HashMap<String, Decorations> dec) {
	   if (action == null)
			action = "";

		if (action.equals("buy")) { //������Ʒ,
			//������빺�ﳵ����Ӧ��Ʒaction��Ϊbuyͬʱ������Ʒ�ı��decNo=<%=entry.getKey()%
			/* String DecorationsNo = request.getParameter("decNo"); */
			Decorations temp = (Decorations) DecorationsCar.get(DecorationsNo);
			if (temp == null) {
				//��� car �в����ڸ���Ʒ
				temp = (Decorations)dec.get(DecorationsNo);
				temp.setBuyNum(1);
				DecorationsCar.put(DecorationsNo, temp);
			} else { //��� car �д��ڸ���Ʒ������������ 1 
				temp.setBuyNum(temp.getBuyNum() + 1);
			     DecorationsCar.put(DecorationsNo, temp);
			}
		}
   }
		//�Ƴ����ﳵ
		public void removeItem(String DecorationsNo,HashMap<String, Decorations> DecorationsCar) {
		//String DecorationsNo = request.getParameter("decNo");
		DecorationsCar.remove(DecorationsNo);
		
		}
		//����ɾ��
		public void minuItem(String[] decNos,HashMap<String, Decorations> DecorationsCar) {
			//String[] decNos = request.getParameterValues("checkOne");//��ȡ���й�ѡ�˵ĸ�ѡ���ֵ���������鷵��
			 if(decNos.length>0){
				 for(int i=0;i<decNos.length;i++){//����������ȫ����ֵ����һɾ��
					 DecorationsCar.remove(decNos[i]);
				 }
			
		}
		}
}
		
   

