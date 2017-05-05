package order;
//���ﳵ����Ʒ��ӡ���ɾ�����޸ġ�
import java.util.ArrayList;
import java.util.Iterator;

public class CartManager {
	//���б�洢���ﳵ��Ϣ
	private ArrayList cart;

	public ArrayList getCart() {
		return cart;
	}

	public void setCart(ArrayList cart) {
		this.cart = cart;
	}
	//��ӵ���Ʒ&����
	public ArrayList addToCart(GoodsBean g,int quantity)
	{	
		if(cart==null){
			//ʵ�������ﳵ����
			cart=new ArrayList();
			//��ӹ��ﳵ
			Item item=new Item(g,quantity);
			cart.add(item);
		}
		else
		{
			//ת��������
			Object items[]=cart.toArray();
			boolean find=false;//��ʾ�Ƿ��ҵ�
			for(int i=0;i<items.length;i++)
			{
				Item temp=(Item)items[i];
				//�жϹ��ﳵ���Ƿ����Ҫ��ӵ���Ʒ
				if(temp.getGoods().getCid().equals(g.getCid()))
				{
					temp.setQuantity(temp.getQuantity()+quantity);
					find=true;
					break;
				}
			}
			if(!find)
			{
				//��ӵ����ﳵ
				Item  item=new Item(g,quantity);
				cart.add(item);
			}
		}
		return cart;
	}
	
	
	public void delete(String cid)
	{
		//ת����Iterator
		Iterator i=cart.iterator();
		while(i.hasNext())
		{
			//�õ�һ��������
			Item temp=(Item)i.next();
			if(temp.getGoods().getCid().equals(cid)){
				cart.remove(temp);
				break;
			}
		}
	}
	public void update(String cid,int quantity)
	{
		Iterator i=cart.iterator();
		while(i.hasNext())
		{
			//�õ�һ��������
			Item temp=(Item)i.next();
			if(temp.getGoods().getCid().equals(cid))
			{
				temp.setQuantity(quantity);
				break;
			}
		}
	}
}
