{
	"contents": {
		"0f11b528-fc53-4385-85a9-eb4578a77b6a": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "btp.wf.supplier",
			"subject": "supplier",
			"name": "supplier",
			"documentation": "Supplier onboarding approval",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "OnboardApprovalStart"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "OnboardApprovalEnd"
				}
			},
			"activities": {
				"f8c92b85-2668-4281-914e-3623436d10d4": {
					"name": "Prepare Rule Request"
				},
				"6f70521d-428b-45db-b840-8ad54428b092": {
					"name": "Get Approver (Rule)"
				},
				"6e4f11da-6ebd-4a64-b775-67836c2286c9": {
					"name": "Extract Approver"
				},
				"fb14fe90-fa93-4ba9-8531-a4db626ac538": {
					"name": "Supplier Approval Form"
				},
				"cfb994ec-cc3a-470a-a288-a49d0ef5e169": {
					"name": "Approval decision"
				},
				"edf30331-fdd5-4958-a730-e19bc01b4462": {
					"name": "Notification Reject"
				},
				"04c82d5f-ef5e-48d2-acd1-3159a2a61d3e": {
					"name": "Prepare S4 Request"
				},
				"6c945588-8205-4fee-82e5-26f8de71ef17": {
					"name": "Create Partner"
				},
				"4f7587ff-d693-46a1-9983-8dadc4f23b05": {
					"name": "Notification Approve"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"719ce333-48b6-484e-bbbe-2aecc9e441c2": {
					"name": "SequenceFlow2"
				},
				"e44648aa-7460-4f9a-ad20-872e7e1c92df": {
					"name": "SequenceFlow3"
				},
				"ab41b5d2-cda6-4577-b1ec-4bc33a6ea37c": {
					"name": "SequenceFlow4"
				},
				"d6e4acf5-2b3d-407e-98cb-ea334b089c95": {
					"name": "SequenceFlow5"
				},
				"6f858cbf-9654-4ddf-83fc-b0f8acaafbc6": {
					"name": "Approved"
				},
				"001c06ee-2efd-4fe5-bc09-c0c2d752f39a": {
					"name": "Rejected"
				},
				"2d1d847e-e235-4dad-a31b-242b8e5efc6d": {
					"name": "SequenceFlow13"
				},
				"6d990f3e-7398-4a84-bceb-1fe4d8b597a1": {
					"name": "SequenceFlow19"
				},
				"6b745f35-aa2c-405b-864e-0ba51c3be52e": {
					"name": "SequenceFlow20"
				},
				"70bd0a69-6c6f-4ceb-86de-9956a86c6bfb": {
					"name": "SequenceFlow22"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "OnboardApprovalStart"
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "OnboardApprovalEnd"
		},
		"f8c92b85-2668-4281-914e-3623436d10d4": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/supplier/ApproverRuleRequest.js",
			"id": "scripttask1",
			"name": "Prepare Rule Request"
		},
		"6f70521d-428b-45db-b840-8ad54428b092": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "BUSINESS_RULES",
			"path": "/rest/v2/workingset-rule-services",
			"httpMethod": "POST",
			"xsrfPath": "",
			"requestVariable": "${context.ruleRequest}",
			"responseVariable": "${context.ruleResponse}",
			"id": "servicetask1",
			"name": "Get Approver (Rule)"
		},
		"6e4f11da-6ebd-4a64-b775-67836c2286c9": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/supplier/ExtractApprover.js",
			"id": "scripttask2",
			"name": "Extract Approver"
		},
		"fb14fe90-fa93-4ba9-8531-a4db626ac538": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "New supplier registration request",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${context.approver}",
			"formReference": "/forms/supplier/Approval.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "approval"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask1",
			"name": "Supplier Approval Form"
		},
		"cfb994ec-cc3a-470a-a288-a49d0ef5e169": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "Approval decision",
			"default": "001c06ee-2efd-4fe5-bc09-c0c2d752f39a"
		},
		"edf30331-fdd5-4958-a730-e19bc01b4462": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Supplier ${context.supplier.name} request rejected",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "aasiyakhan21@gmail.com",
			"formReference": "/forms/supplier/NotificationReject.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "notificationreject"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask4",
			"name": "Notification Reject"
		},
		"04c82d5f-ef5e-48d2-acd1-3159a2a61d3e": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/supplier/S4Request.js",
			"id": "scripttask3",
			"name": "Prepare S4 Request"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "f8c92b85-2668-4281-914e-3623436d10d4"
		},
		"719ce333-48b6-484e-bbbe-2aecc9e441c2": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "f8c92b85-2668-4281-914e-3623436d10d4",
			"targetRef": "6f70521d-428b-45db-b840-8ad54428b092"
		},
		"e44648aa-7460-4f9a-ad20-872e7e1c92df": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "6f70521d-428b-45db-b840-8ad54428b092",
			"targetRef": "6e4f11da-6ebd-4a64-b775-67836c2286c9"
		},
		"ab41b5d2-cda6-4577-b1ec-4bc33a6ea37c": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "6e4f11da-6ebd-4a64-b775-67836c2286c9",
			"targetRef": "fb14fe90-fa93-4ba9-8531-a4db626ac538"
		},
		"d6e4acf5-2b3d-407e-98cb-ea334b089c95": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "SequenceFlow5",
			"sourceRef": "fb14fe90-fa93-4ba9-8531-a4db626ac538",
			"targetRef": "cfb994ec-cc3a-470a-a288-a49d0ef5e169"
		},
		"6f858cbf-9654-4ddf-83fc-b0f8acaafbc6": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask1.last.decision==\"approve\"}",
			"id": "sequenceflow7",
			"name": "Approved",
			"sourceRef": "cfb994ec-cc3a-470a-a288-a49d0ef5e169",
			"targetRef": "04c82d5f-ef5e-48d2-acd1-3159a2a61d3e"
		},
		"001c06ee-2efd-4fe5-bc09-c0c2d752f39a": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow8",
			"name": "Rejected",
			"sourceRef": "cfb994ec-cc3a-470a-a288-a49d0ef5e169",
			"targetRef": "edf30331-fdd5-4958-a730-e19bc01b4462"
		},
		"2d1d847e-e235-4dad-a31b-242b8e5efc6d": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow13",
			"name": "SequenceFlow13",
			"sourceRef": "edf30331-fdd5-4958-a730-e19bc01b4462",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"793ce341-e84d-4223-a83a-c8ed82559b40": {},
				"df57cdc1-aa15-4656-b202-ff13bd376483": {},
				"07f2d5e2-907d-4bb7-8ee2-810f8f9a825d": {},
				"fecaeda8-f290-484a-ae66-f7c9fdd35023": {},
				"15ca2457-a1ca-4b87-8f9c-e0cf40aee23d": {},
				"1b1c609e-198e-4305-b402-f38a8732a7ce": {},
				"c4e1eb5d-50b8-4b82-aaf1-c5c74a1ffd91": {},
				"f27557fa-3f6e-4b7f-87d2-4b0208fc6434": {},
				"716fad43-b4d7-4422-aa34-2a2eece1f84a": {},
				"fc9b4e2d-dfab-41ce-814f-57a530ebaa32": {},
				"60e33d21-9ee9-4698-acd1-56bf1ad4de1b": {},
				"b35cdc97-d0fb-4387-816e-5cd06baa570d": {},
				"0816d730-5095-4df4-8df3-4336a3424629": {},
				"24283475-e43c-4147-b19f-6312b1ad8b1d": {},
				"c9e8382e-1e9c-4a4d-b384-b12a402147d9": {},
				"6e63e693-0a16-4a22-8afc-d8a508a4a0a5": {},
				"798569d6-6565-42ac-88db-0fdda85c9d78": {},
				"f7dc4a5c-8f9b-4e7c-9d19-b0787d433941": {},
				"e111091d-a51f-40fc-98fc-93c678d19245": {}
			}
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 12,
			"y": 81,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 1295.9999964237213,
			"y": 79.5,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "44,97 94,97",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "793ce341-e84d-4223-a83a-c8ed82559b40",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"793ce341-e84d-4223-a83a-c8ed82559b40": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 94,
			"y": 67,
			"width": 100,
			"height": 60,
			"object": "f8c92b85-2668-4281-914e-3623436d10d4"
		},
		"df57cdc1-aa15-4656-b202-ff13bd376483": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "194,97 244,97",
			"sourceSymbol": "793ce341-e84d-4223-a83a-c8ed82559b40",
			"targetSymbol": "07f2d5e2-907d-4bb7-8ee2-810f8f9a825d",
			"object": "719ce333-48b6-484e-bbbe-2aecc9e441c2"
		},
		"07f2d5e2-907d-4bb7-8ee2-810f8f9a825d": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 244,
			"y": 67,
			"width": 100,
			"height": 60,
			"object": "6f70521d-428b-45db-b840-8ad54428b092"
		},
		"fecaeda8-f290-484a-ae66-f7c9fdd35023": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "344,97 394,97",
			"sourceSymbol": "07f2d5e2-907d-4bb7-8ee2-810f8f9a825d",
			"targetSymbol": "15ca2457-a1ca-4b87-8f9c-e0cf40aee23d",
			"object": "e44648aa-7460-4f9a-ad20-872e7e1c92df"
		},
		"15ca2457-a1ca-4b87-8f9c-e0cf40aee23d": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 394,
			"y": 67,
			"width": 100,
			"height": 60,
			"object": "6e4f11da-6ebd-4a64-b775-67836c2286c9"
		},
		"1b1c609e-198e-4305-b402-f38a8732a7ce": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "494,97 544,97",
			"sourceSymbol": "15ca2457-a1ca-4b87-8f9c-e0cf40aee23d",
			"targetSymbol": "c4e1eb5d-50b8-4b82-aaf1-c5c74a1ffd91",
			"object": "ab41b5d2-cda6-4577-b1ec-4bc33a6ea37c"
		},
		"c4e1eb5d-50b8-4b82-aaf1-c5c74a1ffd91": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 544,
			"y": 67,
			"width": 100,
			"height": 60,
			"object": "fb14fe90-fa93-4ba9-8531-a4db626ac538"
		},
		"f27557fa-3f6e-4b7f-87d2-4b0208fc6434": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "644,97 694,97",
			"sourceSymbol": "c4e1eb5d-50b8-4b82-aaf1-c5c74a1ffd91",
			"targetSymbol": "716fad43-b4d7-4422-aa34-2a2eece1f84a",
			"object": "d6e4acf5-2b3d-407e-98cb-ea334b089c95"
		},
		"716fad43-b4d7-4422-aa34-2a2eece1f84a": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 694,
			"y": 76,
			"object": "cfb994ec-cc3a-470a-a288-a49d0ef5e169"
		},
		"fc9b4e2d-dfab-41ce-814f-57a530ebaa32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "736,97 770.9999994039536,97 770.9999994039536,152 805.9999988079071,152",
			"sourceSymbol": "716fad43-b4d7-4422-aa34-2a2eece1f84a",
			"targetSymbol": "24283475-e43c-4147-b19f-6312b1ad8b1d",
			"object": "6f858cbf-9654-4ddf-83fc-b0f8acaafbc6"
		},
		"60e33d21-9ee9-4698-acd1-56bf1ad4de1b": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "736,97 770.9999994039536,97 770.9999994039536,42 805.9999988079071,42",
			"sourceSymbol": "716fad43-b4d7-4422-aa34-2a2eece1f84a",
			"targetSymbol": "b35cdc97-d0fb-4387-816e-5cd06baa570d",
			"object": "001c06ee-2efd-4fe5-bc09-c0c2d752f39a"
		},
		"b35cdc97-d0fb-4387-816e-5cd06baa570d": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 805.9999988079071,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "edf30331-fdd5-4958-a730-e19bc01b4462"
		},
		"0816d730-5095-4df4-8df3-4336a3424629": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "905.9999988079071,42 940.9999982118607,42 940.9999982118607,49.000000298023224 1260.9999970197678,49.000000298023224 1260.9999970197678,97 1295.9999964237213,97",
			"sourceSymbol": "b35cdc97-d0fb-4387-816e-5cd06baa570d",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "2d1d847e-e235-4dad-a31b-242b8e5efc6d"
		},
		"24283475-e43c-4147-b19f-6312b1ad8b1d": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 805.9999988079071,
			"y": 122,
			"width": 100,
			"height": 60,
			"object": "04c82d5f-ef5e-48d2-acd1-3159a2a61d3e"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"maildefinition": 2,
			"sequenceflow": 22,
			"startevent": 1,
			"endevent": 1,
			"usertask": 4,
			"servicetask": 4,
			"scripttask": 3,
			"mailtask": 2,
			"exclusivegateway": 2
		},
		"6c945588-8205-4fee-82e5-26f8de71ef17": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "CAL",
			"path": "/sap/opu/odata/sap/API_BUSINESS_PARTNER/A_BusinessPartner",
			"httpMethod": "POST",
			"xsrfPath": "/sap/opu/odata/sap/API_BUSINESS_PARTNER/A_BusinessPartner",
			"requestVariable": "${context.s4request}",
			"responseVariable": "${context.s4response}",
			"headers": [{
				"name": "Content-Type",
				"value": "application/json"
			}],
			"id": "servicetask4",
			"name": "Create Partner"
		},
		"c9e8382e-1e9c-4a4d-b384-b12a402147d9": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 975.9999976158142,
			"y": 84.99999970197678,
			"width": 100,
			"height": 60,
			"object": "6c945588-8205-4fee-82e5-26f8de71ef17"
		},
		"6d990f3e-7398-4a84-bceb-1fe4d8b597a1": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow19",
			"name": "SequenceFlow19",
			"sourceRef": "6c945588-8205-4fee-82e5-26f8de71ef17",
			"targetRef": "4f7587ff-d693-46a1-9983-8dadc4f23b05"
		},
		"6e63e693-0a16-4a22-8afc-d8a508a4a0a5": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1075.9999976158142,114.99999970197678 1125.9999976158142,114.99999970197678",
			"sourceSymbol": "c9e8382e-1e9c-4a4d-b384-b12a402147d9",
			"targetSymbol": "f7dc4a5c-8f9b-4e7c-9d19-b0787d433941",
			"object": "6d990f3e-7398-4a84-bceb-1fe4d8b597a1"
		},
		"6b745f35-aa2c-405b-864e-0ba51c3be52e": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow20",
			"name": "SequenceFlow20",
			"sourceRef": "04c82d5f-ef5e-48d2-acd1-3159a2a61d3e",
			"targetRef": "6c945588-8205-4fee-82e5-26f8de71ef17"
		},
		"798569d6-6565-42ac-88db-0fdda85c9d78": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "905.9999988079071,152 940.9999982118607,152 940.9999982118607,114.99999970197678 975.9999976158142,114.99999970197678",
			"sourceSymbol": "24283475-e43c-4147-b19f-6312b1ad8b1d",
			"targetSymbol": "c9e8382e-1e9c-4a4d-b384-b12a402147d9",
			"object": "6b745f35-aa2c-405b-864e-0ba51c3be52e"
		},
		"4f7587ff-d693-46a1-9983-8dadc4f23b05": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Supplier ${context.supplier.name} successfully onboarded",
			"description": "Partner ${context.s4response.d.BusinessPartner} created in S4",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "aasiyakhan21@gmail.com",
			"formReference": "/forms/supplier/NotificationApprove.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "notificationapprove"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask3",
			"name": "Notification Approve"
		},
		"f7dc4a5c-8f9b-4e7c-9d19-b0787d433941": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 1125.9999976158142,
			"y": 84.99999970197678,
			"width": 100,
			"height": 60,
			"object": "4f7587ff-d693-46a1-9983-8dadc4f23b05"
		},
		"70bd0a69-6c6f-4ceb-86de-9956a86c6bfb": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow22",
			"name": "SequenceFlow22",
			"sourceRef": "4f7587ff-d693-46a1-9983-8dadc4f23b05",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"e111091d-a51f-40fc-98fc-93c678d19245": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1225.9999976158142,114.99999970197678 1260.9999970197678,114.99999970197678 1260.9999970197678,97 1295.9999964237213,97",
			"sourceSymbol": "f7dc4a5c-8f9b-4e7c-9d19-b0787d433941",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "70bd0a69-6c6f-4ceb-86de-9956a86c6bfb"
		}
	}
}