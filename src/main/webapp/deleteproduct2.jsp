<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.shoppingcart.dto.Merchant"%>
<%@page import="com.shoppingcart.dto.Product"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("id");

int id1=Integer.parseInt(id);

EntityManagerFactory emf=Persistence.createEntityManagerFactory("rushabh");
EntityManager em=emf.createEntityManager();
EntityTransaction et=em.getTransaction();


  Product product=em.find(Product.class, id1);
  
	Merchant m=product.getMerchant();
	Merchant merchant=(Merchant)session.getAttribute("merchant");
	
	product.setMerchant(merchant);
	
	List<Product>products=new ArrayList();
	products.add(product);
	
//	m.setProducts(products);
	
	if(m!=null){
		
		List<Product>products2=new ArrayList();
		
		for(Product p:m.getProducts())
		{
			
			if(p.getId()==id1)
			{
				
			}
			else
			{
				products2.add(p);
			}
			
		}
		
		m.setProducts(products);
		
		 et.begin();
		  em.remove(product);
		  et.commit();
		  
		 RequestDispatcher rd=request.getRequestDispatcher("deleteproduct.jsp");
		 rd.forward(request, response);
		 
	}
	else{
		
		
	}
	
 
 
 
 
  
%>
</body>
</html>