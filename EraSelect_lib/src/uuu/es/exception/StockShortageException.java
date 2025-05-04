package uuu.es.exception;

import uuu.es.entity.OrderItem;

public class StockShortageException extends ESException {

	private final OrderItem item;
	private static final String errorMsg = "庫存不足";
	
	public StockShortageException(OrderItem item) {
		super(errorMsg);
		this.item = item;
	}

	public StockShortageException(String message ,OrderItem item) {
		super(message);
		this.item = item;
	}
	
	@Override
	public String toString() {
		String msg = String.format("[%s-%s-%s]%s", item.getProductId(),item.getColorName(),item.getSpecName(),this.getMessage());
		return msg;
	}
	
}
