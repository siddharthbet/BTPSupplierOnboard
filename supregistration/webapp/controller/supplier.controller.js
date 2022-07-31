sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/m/MessageBox"
],
    /**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (Controller, MessageBox) {
        "use strict";

        return Controller.extend("com.hv.supregistration.controller.supplier", {
            onInit: function () {

            },
            _fetchToken: function() {
                var token;
                $.ajax({
                    url: "/zsupreg.comhvsupregistration/bpmworkflowruntime/v1/xsrf-token",
                    method: "GET",
                    async: false,
                    headers: {
                        "X-CSRF-Token": "Fetch"
                    },
                    success: function(result, xhr, data) {
                        token = data.getResponseHeader("X-CSRF-Token");
                    }
                });
                return token;
            },
            _startInstance: function(token) {
                var oview = this.getView();
                var name = oview.byId("name").getValue();
                var city = oview.byId("city").getValue();
                var country = oview.byId("country").getValue();
                var lang = oview.byId("lang").getValue();
                var product = oview.byId("product").getValue();

                var model = this.getView().getModel();
                var inputValue = model.getProperty("/text");
                var oPostData ={
                    "definitionId": "btp.wf.supplier",                
                    "context": {                
                            "supplier": {                
                            "name": name,                
                                "city": city,                
                                "country": country,                
                                "language": lang,                
                                "product": product                
                            },                
                            "approver": "",                
                            "ruleResponse": "",                
                            "ruleRequest": ""                
                    }                
                };
                $.ajax({
                    url: "/zsupreg.comhvsupregistration/bpmworkflowruntime/v1/workflow-instances",
                    method: "POST",
                    async: false,
                    contentType: "application/json",
                    headers: {
                        "X-CSRF-Token": token
                    },
                    data: JSON.stringify(oPostData),
                    success: function(result, xhr, data) {
                        model.setProperty("/result", JSON.stringify(result, null, 4));
                        MessageBox.success("Supplier Registration submitted succesfully!");
                        debugger;
                    },
                    error: function(e) {
                        debugger;
                    }
                });
            },

            onSubmit: function () {
                

                //  MessageBox.success("Supplier Registration submitted succesfully!");
            //    var appId = this.getOwnerComponent().getManifestEntry("/sap.app/id");
            //     var appPath = appId.replaceAll(".", "/");
            //     var appModulePath = jQuery.sap.getModulePath(appPath);
                debugger;
                // jQuery.ajax({
                //     url: "/zsupreg.comhvsupregistration/bpmworkflowruntime/v1/xsrf-token", //appModulePath + "/bpmworkflowruntime/v1/xsrf-token",
                //     method: "GET",
                //     async: false,
                //     headers: {
                //         "X-CSRF-Token": "Fetch"
                //     },
                //     success(result, xhr, data) {
                //         fetchedToken = data.getResponseHeader("X-CSRF-Token");
                //         debugger;
                //     },
                //     error(e) {
                //         debugger;
                //     }
                // })
                var surl3 =  "/zsupreg.comhvsupregistration/bpmworkflowruntime/v1/xsrf-token";
                var token = this._fetchToken();
    this._startInstance(token);
              
               
              
            
                      
            }
        });
    });
