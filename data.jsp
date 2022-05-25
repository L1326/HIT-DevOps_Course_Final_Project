 <body>
<%
		StringBuffer document = new StringBuffer();
		String today = "";
	try {
		Date nowDate=new Date();
		
		String []date={"Day","One","Two","Three","Four","Five","Six"};
		int day=nowDate.getDay();
		String dayFinal="";

		for(int i=0;i<date.length;i++){
			if(i==day){
				dayFinal=date[i];
			}
		}
		today=nowDate.getYear()+1900+"year"+(nowDate.getMonth()+1)+"month"+nowDate.getDate()+"day"+" "+"week"+dayFinal;

		URL url = new URL("http://www.raychou.com/weather/rss.php?id=54511");
		URLConnection conn = url.openConnection(); 

		InputStreamReader in = new InputStreamReader(conn.getInputStream(),"utf-8");
		BufferedReader reader = new BufferedReader(in); 

		String line = null; 
		conn.setConnectTimeout(10000);
		String line1 = null;

		while ((line = reader.readLine()) != null) 

		document.append(line + "\n"); 
		reader.close(); 
		in.close();in = null;//release stream

		String abc=new String(document.toString().getBytes("utf-8"),"utf-8");

		String finalValue="";
		
		int start=abc.indexOf("<description>");
		int end=abc.indexOf("</description>");
		
		if(start!=-1 && end!=-1 ){
			finalValue="Beijing:"+abc.substring(start+"</description>".length()+2,end);
		}

%>
	<table>
		<tr>
			<td width="85%">
			<MARQUEE BEHAVIOR=SCROLL DIRECTION=LEFT SCROLLAMOUT=10 SCROLLDELAY=150 onMouseOver="this.stop();" onMouseOut="this.start();">
			<%=finalValue%>
			</MARQUEE>
			</td>
			<td width="15%" nowrap><%=today%>           
			</td>
		</tr>
	</table>
<%
	}catch (MalformedURLException e) {
		System.out.println(e);
	}catch (IOException e){
		System.out.println(e);
		out.println("<table><tr><td width=\"85%\"></td><td width=\"15%\" nowrap>"+today+" </td></tr> </table>");
	}
%>

  </body>  