CREATE TABLE "PrequalResult" (
  "pk" SERIAL PRIMARY KEY,
  "name" varchar,
  "loanapp_id" int,
  "result" boolean,
  "error_reason" varchar,
  "detail_results" varchar,
  "fico_v2" varchar,
  "report_type" varchar,
  "username" varchar,
  "created_at" datetime,
  "xml_detail_id" varchar,
  "personal_total_monthly_payments" varchar,
  "personal_credit_card_total_limits" varchar,
  "personal_credit_card_total_balances" varchar,
  "business_credit_card_total_limits" varchar,
  "business_credit_card_total_balances" varchar,
  "business_total_mortgage_monthly_payments" varchar,
  "business_total_monthly_debt_payments" varchar,
  "bkdate" datetime,
  "fico_v3" varchar,
  "total_mortgage_monthly_payments" varchar,
  "version" varchar,
  "role" varchar
);

CREATE TABLE "XML_Detail" (
  "id" SERIAL PRIMARY KEY,
  "CompletionCode" int,
  "ReferenceId" varchar,
  "TransactionId" int,
  "_xmlns" varchar,
  "product_id" int
);

CREATE TABLE "Product" (
  "id" SERIAL PRIMARY KEY,
  "_xmlns" varchar,
  "CreditProfile_id" int
);

CREATE TABLE "CreditProfile" (
  "id" SERIAL PRIMARY KEY,
  "header_id" int,
  "inquiry_id" varchar
);

CREATE TABLE "Header" (
  "id" SERIAL PRIMARY KEY,
  "ReportDate" datetime,
  "ReportTime" int,
  "Preamble" varchar,
  "ARFVersion" char
);

CREATE TABLE "RiskModel" (
  "id" SERIAL PRIMARY KEY,
  "CredicProfile_id" varchar,
  "ModelIndicator_code" char,
  "Score" int,
  "ScoreFactorCodeOne" char,
  "ScoreFactorCodeTwo" char,
  "ScoreFactorCodeThree" char,
  "ScoreFactorCodeFour" char,
  "Evaluation_code" char
);

CREATE TABLE "ConsumerIdentity" (
  "id" SERIAL PRIMARY KEY,
  "CredicProfile_id" varchar,
  "Type_code" char,
  "Surname" varchar,
  "First" varchar,
  "Middle" varchar,
  "Gen" varchar,
  "YOB" varchar
);

CREATE TABLE "AddressInfo" (
  "id" SERIAL PRIMARY KEY,
  "CredicProfile_id" varchar,
  "FirstReportedDate" datetime,
  "LastUpdatedDate" datetime,
  "Origination_code" char,
  "TimesReported" int,
  "LastReportingSubcode" int,
  "DwellingType_code" char,
  "HomeOwnership_code" char,
  "StreetPrefix" varchar,
  "StreetName" varchar,
  "StreetSuffix" varchar,
  "City" varchar,
  "State" char,
  "Zip" char,
  "CensusGeoCode" varchar
);

CREATE TABLE "EmploymentInfo" (
  "id" SERIAL PRIMARY KEY,
  "CredicProfile_id" varchar,
  "FirstReportedDate" datetime,
  "LastUpdatedDate" datetime,
  "Origination_code" char,
  "Name" varchar,
  "AddressFirstLine" varchar,
  "AddressSecondLine" varchar,
  "AddressExtraLine" varchar,
  "Zip" char
);

CREATE TABLE "TradeLine" (
  "id" SERIAL PRIMARY KEY,
  "CredicProfile_id" varchar,
  "SpecialComment_code" char,
  "Evaluation_code" char,
  "OpenDate" datetime,
  "StatusDate" int,
  "MaxDelinquencyDate" datetime,
  "AccountType_code" char,
  "TermsDuration_code" char,
  "ECOA_code" char,
  "BalanceDate" datetime,
  "BalanceAmount" int,
  "Status_code" char,
  "AmountPastDue" varchar,
  "OpenOrClosed_code" char,
  "RevolvingOrInstallment_code" char,
  "ConsumerComment" varchar,
  "MonthsHistory" int,
  "DelinquenciesOver30Days" int,
  "DelinquenciesOver60Days" int,
  "DelinquenciesOver90Days" int,
  "DerogCounter" int,
  "PaymentProfile" varchar,
  "MonthlyPaymentAmount" int,
  "MonthlyPaymentType_code" char,
  "LastPaymentDate" datetime,
  "Subcode" int,
  "KOB_code" char,
  "SubscriberDisplayName" varchar,
  "EnhancedPaymentData_id" int
);

CREATE TABLE "TradeLineAmount" (
  "id" SERIAL PRIMARY KEY,
  "TradeLine_id" varchar,
  "Qualifier_code" char,
  "Value" int
);

CREATE TABLE "EnhancedPaymentData" (
  "id" SERIAL PRIMARY KEY,
  "InitialPaymentLevelDate" datetime,
  "AccountCondition_code" char,
  "PaymentStatus_code" char,
  "AccountType_code" char,
  "SpecialComment_code" char
);

CREATE TABLE "Inquiry" (
  "id" SERIAL PRIMARY KEY,
  "Date" datetime,
  "Amount" varchar,
  "Type_code" char,
  "Terms_code" char,
  "Subcode" varchar,
  "KOB_code" char,
  "SubscriberDisplayName" varchar
);

CREATE TABLE "InformationalMessage" (
  "id" SERIAL PRIMARY KEY,
  "CredicProfile_id" varchar,
  "MessageNumber" int,
  "MessageText" text
);

ALTER TABLE "XML_Detail" ADD FOREIGN KEY ("product_id") REFERENCES "Product" ("id");

ALTER TABLE "Product" ADD FOREIGN KEY ("CreditProfile_id") REFERENCES "CreditProfile" ("id");

ALTER TABLE "XML_Detail" ADD FOREIGN KEY ("id") REFERENCES "PrequalResult" ("xml_detail_id");

ALTER TABLE "Header" ADD FOREIGN KEY ("id") REFERENCES "CreditProfile" ("header_id");

ALTER TABLE "EnhancedPaymentData" ADD FOREIGN KEY ("id") REFERENCES "TradeLine" ("EnhancedPaymentData_id");

ALTER TABLE "Inquiry" ADD FOREIGN KEY ("id") REFERENCES "CreditProfile" ("inquiry_id");

ALTER TABLE "CreditProfile" ADD FOREIGN KEY ("id") REFERENCES "RiskModel" ("CredicProfile_id");

ALTER TABLE "CreditProfile" ADD FOREIGN KEY ("id") REFERENCES "ConsumerIdentity" ("CredicProfile_id");

ALTER TABLE "CreditProfile" ADD FOREIGN KEY ("id") REFERENCES "AddressInfo" ("CredicProfile_id");

ALTER TABLE "CreditProfile" ADD FOREIGN KEY ("id") REFERENCES "EmploymentInfo" ("CredicProfile_id");

ALTER TABLE "CreditProfile" ADD FOREIGN KEY ("id") REFERENCES "TradeLine" ("CredicProfile_id");

ALTER TABLE "CreditProfile" ADD FOREIGN KEY ("id") REFERENCES "InformationalMessage" ("CredicProfile_id");

ALTER TABLE "TradeLine" ADD FOREIGN KEY ("id") REFERENCES "TradeLineAmount" ("TradeLine_id");
