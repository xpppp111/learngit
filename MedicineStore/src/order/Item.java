package order;
//һ����Ʒ�Լ�����Ʒ������
public class Item {
	private GoodsBean goods;
	private int quantity;
	
	public Item(GoodsBean d ,int quantity)
	{this.goods=d;
	 this.quantity=quantity;	
	}
	 
	public void setGoods(GoodsBean goods) {
		this.goods = goods;
	}

	public GoodsBean getGoods() {
		return goods;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
