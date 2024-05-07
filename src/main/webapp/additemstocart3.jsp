<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.hibernate.cache.spi.support.AbstractReadWriteAccess.Item"%>
<%@page import="javax.persistence.Query"%>
<%@page import="com.shoppingcart.dto.Cart"%>
<%@page import="com.shoppingcart.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.shoppingcart.dto.Merchant"%>
<%@page import="com.shoppingcart.dto.Items"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityTransaction"%>
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

Query query=em.createQuery("select u from Product u where u.id=?1");
query.setParameter(1, id1);

List<Product>products = query.getResultList();


	for(Product p:products){
		
		int stock =p.getStock();
			Items i1=new Items();
			=i1.getQuantity();
		
		if(stock>=quantity){
			
			
			i1.setId(p.getId());
			i1.setName(p.getName());
			i1.setCategory(p.getCategory());
			i1.setPrice(p.getPrice());
			i1.setQuantity(p.getStock());
				
			List<Items>it1=new ArrayList();
			it1.add(i1);
			
			Cart c1=new Cart();	
			c1.setItems(it1);
			
			i1.setCart(c1);
			
			et.begin();
			em.persist(i1);
			em.persist(c1);
			et.commit();

			
			PrintWriter pw=response.getWriter();
			pw.write("items added succesfully");
		}
	
	}
	
	



/* Items i1=new Items();

Merchant m=(Merchant)session.getAttribute("merchant");

  List<Product>p2 =m.getProducts();
  
  Cart c1=new Cart(); */
  
  


%>
</body>
</html>