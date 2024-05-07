package com.shoppingcart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingcart.dto.Admin;

@WebServlet("/saveadmin")
public class SaveAdmin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id=req.getParameter("id");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("rushabh");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		Admin admin=new Admin();
		admin.setId(Integer.parseInt(id));
		admin.setEmail(email);
		admin.setPassword(password);
		
		et.begin();
		em.persist(admin);
		et.commit();
		
		PrintWriter pw=resp.getWriter();
		pw.write("Account created successfully");
		  
		RequestDispatcher rd=req.getRequestDispatcher("login.html");
		rd.include(req, resp);
		  
	    resp.setContentType("text/html");
	}
}
