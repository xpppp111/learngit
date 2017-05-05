package order;
//购物车的商品添加、伤删除、修改。
import java.util.ArrayList;
import java.util.Iterator;

public class CartManager {
	//用列表存储购物车信息
	private ArrayList cart;

	public ArrayList getCart() {
		return cart;
	}

	public void setCart(ArrayList cart) {
		this.cart = cart;
	}
	//添加的物品&数量
	public ArrayList addToCart(GoodsBean g,int quantity)
	{	
		if(cart==null){
			//实例化购物车对象
			cart=new ArrayList();
			//添加购物车
			Item item=new Item(g,quantity);
			cart.add(item);
		}
		else
		{
			//转换成数组
			Object items[]=cart.toArray();
			boolean find=false;//表示是否找到
			for(int i=0;i<items.length;i++)
			{
				Item temp=(Item)items[i];
				//判断购物车中是否存在要添加的物品
				if(temp.getGoods().getCid().equals(g.getCid()))
				{
					temp.setQuantity(temp.getQuantity()+quantity);
					find=true;
					break;
				}
			}
			if(!find)
			{
				//添加到购物车
				Item  item=new Item(g,quantity);
				cart.add(item);
			}
		}
		return cart;
	}
	
	
	public void delete(String cid)
	{
		//转换成Iterator
		Iterator i=cart.iterator();
		while(i.hasNext())
		{
			//得到一个购物项
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
			//得到一个购物项
			Item temp=(Item)i.next();
			if(temp.getGoods().getCid().equals(cid))
			{
				temp.setQuantity(quantity);
				break;
			}
		}
	}
}
