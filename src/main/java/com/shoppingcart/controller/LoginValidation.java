package com.shoppingcart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingcart.dto.Admin;
import com.shoppingcart.dto.Customer;
import com.shoppingcart.dto.Merchant;

@WebServlet("/Loginvalidate")
public class LoginValidation extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		String choice=req.getParameter("choice");
		
		if(choice.equals("Customer"))
		{
			EntityManagerFactory emf=Persistence.createEntityManagerFactory("rushabh");
			EntityManager em=emf.createEntityManager();
			EntityTransaction et=em.getTransaction();
			
			Query query= em.createQuery("select u from Customer u where u.email=?1 and u.password=?2");
			query.setParameter(1, email);
			query.setParameter(2, password);
			
			List<Customer>customers = query.getResultList();
			
			if(customers.size()>0)
			{
				RequestDispatcher rd=req.getRequestDispatcher("customeroptions.html");
				rd.forward(req, resp);
				
				
			}
			else
			{
				PrintWriter pw=resp.getWriter();
				pw.write("invalid credentials");
				
				RequestDispatcher rd=req.getRequestDispatcher("login.html");
				rd.include(req, resp);
				resp.setContentType("text/html");
				
			}
			
			
		}
		else if(choice.equals("Merchant")) {
			

			EntityManagerFactory emf=Persistence.createEntityManagerFactory("rushabh");
			EntityManager em=emf.createEntityManager();
			EntityTransaction et=em.getTransaction();
			
			Query query= em.createQuery("select u from Merchant u where u.email=?1 and u.password=?2");
			query.setParameter(1, email);
			query.setParameter(2, password);
			
			List<Merchant>merchants = query.getResultList();
			
			if(merchants.size()>0)
			{
				Merchant m= merchants.get(0);
				
				if(m.getStatus().equals("active"))
				{
					HttpSession hs=req.getSession();
					hs.setAttribute("merchant",m);
					
					RequestDispatcher rd=req.getRequestDispatcher("merchantoptions.html");
					rd.forward(req, resp);
					
				}
				else if(m.getStatus().equals("inactive"))
				{
					PrintWriter pw=resp.getWriter();
					pw.write("your account is not active");
					
					RequestDispatcher rd=req.getRequestDispatcher("login.html");
					rd.include(req, resp);
					resp.setContentType("text/html");
					
				}
				else if(m.getStatus().equals("blocked"))
				{
					
					PrintWriter pw=resp.getWriter();
					pw.write("your account is blocked");
					
					RequestDispatcher rd=req.getRequestDispatcher("login.html");
					rd.include(req, resp);
					resp.setContentType("text/html");
					
				}
				
			}
			else
			{
				PrintWriter pw=resp.getWriter();
				pw.write("invalid credentials");
				
				RequestDispatcher rd=req.getRequestDispatcher("login.html");
				rd.include(req, resp);
				resp.setContentType("text/html");
				
			}
			
		}
		else if(choice.equals("Admin"))
		{
			
		
			EntityManagerFactory emf=Persistence.createEntityManagerFactory("rushabh");
			EntityManager em=emf.createEntityManager();
			EntityTransaction et=em.getTransaction();
			
			Query query= em.createQuery("select u from Admin u where u.email=?1 and u.password=?2");
			query.setParameter(1, email);
			query.setParameter(2, password);
			
			List<Admin>admins = query.getResultList();
			
			if(admins.size()>0)
			{
				Admin a=admins.get(0);
				HttpSession hs=req.getSession();
				hs.setAttribute("admin", a);
				
				RequestDispatcher rd=req.getRequestDispatcher("adminoptions.html");
				rd.forward(req, resp);

			}
			else
			{
				PrintWriter pw=resp.getWriter();
				pw.write("invalid credentials");
				
				RequestDispatcher rd=req.getRequestDispatcher("login.html");
				rd.include(req, resp);
				resp.setContentType("text/html");
				
			}
		}
		
		
	}
}
