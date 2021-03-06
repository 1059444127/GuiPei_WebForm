﻿<%@ WebHandler Language="C#" Class="Instructor2" %>

using System.Web;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web.Script.Serialization;
using Common;

public class Instructor2 : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string trainingbaseCode = CommonFunc.SafeGetStringFromObj(context.Request.Form["trainingbaseCode"]);
        string professionalbaseCode = CommonFunc.SafeGetStringFromObj(context.Request.Form["professionalbaseCode"]);
        string type = CommonFunc.SafeGetStringFromObj(context.Request.Form["type"]);
        string real_name = CommonFunc.SafeGetStringFromObj(context.Request.Form["real_name"]);
        
        BLL.LoginBLL loginBLL = new BLL.LoginBLL();
        List<Model.LoginModel> list = new List<Model.LoginModel>();
        list = loginBLL.getTeachersName(trainingbaseCode, professionalbaseCode,type,real_name);
        JavaScriptSerializer jss = new JavaScriptSerializer();
        string json = jss.Serialize(list);
        context.Response.Write(json);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}