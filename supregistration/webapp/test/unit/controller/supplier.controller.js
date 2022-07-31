/*global QUnit*/

sap.ui.define([
	"comhv/supregistration/controller/supplier.controller"
], function (Controller) {
	"use strict";

	QUnit.module("supplier Controller");

	QUnit.test("I should test the supplier controller", function (assert) {
		var oAppController = new Controller();
		oAppController.onInit();
		assert.ok(oAppController);
	});

});
