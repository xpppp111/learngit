package order;
//一种物品以及该物品的数量
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
