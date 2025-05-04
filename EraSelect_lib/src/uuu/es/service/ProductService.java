package uuu.es.service;

import java.util.List;

import uuu.es.entity.Product;
import uuu.es.entity.Spec;
import uuu.es.exception.ESDataInvalidException;
import uuu.es.exception.ESException;

public class ProductService {
	private ProductsDAO dao = new ProductsDAO();
	public List<Product> getAllProducts()throws ESException{
		return dao.selectAllProducts();
	}
	
	
	public List<Product> getProductsByKeyword(String keyword) throws ESException{
		if(keyword==null || keyword.length()==0) {
			throw new IllegalArgumentException("關鍵字查詢keyword不得為null或空字串");
		}
		return dao.selectProductsByKeyword(keyword);
	}
	
	
	public List<Product> getProductsByCategory(String category) throws ESException{
		if(category==null || category.length()==0) {
			throw new IllegalArgumentException("分類查詢category不得為null或空字串");
		}
		
		return dao.selectProductsByCategory(category);
	}
	
	public List<Product> getLatestProducts() throws ESException{
		return dao.selectLatestProducts();
	}
	
	public List<Product> getLatestProducts2() throws ESException{
		return dao.selectLatestProducts2();
	}
	
	public List<Product> getProductsByDiscount() throws ESException{
		return dao.selectProductsByDiscount();
	}
	
	public Product getProductById(String id) throws ESException{
		if(id==null || id.length()==0) {
			throw new IllegalArgumentException("用id查詢產品 id不得為null或空字串");
		}
		return dao.selectProductById(id);
	}
	
	
	public List<Spec> getProductSpecsByIdAndColorName(String productId, String colorName) throws ESException{
		if(productId==null || productId.length()==0){
			throw new IllegalArgumentException("查詢[指定產品-顏色]的specList時,productId必須有值");
		}
		return dao.selectProductSpecsByIdAndColorName(productId,colorName);
	}
	

	public Spec getTheSpec(String productId, String colorName, String specName) throws ESException {
		if(productId==null || productId.length()==0) throw new IllegalArgumentException("查詢[指定產品-顏色-規格]時,productId必須有值");
		if(specName==null || specName.length()==0) throw new IllegalArgumentException("查詢[指定產品-顏色-規格]時,specName必須有值");
		if(colorName==null) colorName="";
		
		Spec theSpec =null;
		
		List<Spec> list = dao.selectProductSpecsByIdAndColorName(productId, colorName);
		if(list!=null && list.size()>0) {
			for(int i=0;i<list.size();i++) {
				Spec spec = list.get(i);
				if(specName.equals(spec.getSpecName())) {
					theSpec = spec;
					break;
				}
			}
		}
		if(theSpec==null) {
			String erMsg = String.format("找不到指定的規格: %s-%s-%s", productId, colorName, specName);
			throw new ESDataInvalidException(erMsg);
		}
		return theSpec;
	}
	
	
	//提供[即時庫存查詢的]商業邏輯 
	public int getStockByProductIdColorNameSpecName(int productId ,String colorName ,String specName) throws ESException{
		if(productId<=0) throw new IllegalArgumentException("查詢庫存必須有productId");
		
		if(colorName==null) colorName="";
	    if(specName==null) specName="";
		
		return dao.selectStockByProductIdColorNameSpecName(productId, colorName, specName);
	}
	
	
	//查詢價格由小到大
	public List<Product> getProductsByASC() throws ESException{
		return dao.selectProductsByASC();
	}
	
	//查詢價格由大到小
	public List<Product> getProductsByDESC() throws ESException{
		return dao.selectProductsByDESC();
	}
	
	//查詢區間價格
	public List<Product> getProductsByPrice(String minPrice, String maxPrice) throws ESException{
		return dao.selectProductsByPrice(minPrice, maxPrice);
	}
	
	
	
}
