--create patients table
CREATE TABLE patients (id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR (40), date_of_birth DATE);
ALTER TABLE patients  ADD PRIMARY KEY(id);

--create medical-histories
CREATE TABLE medical_histories (id INT GENERATED ALWAYS AS IDENTITY, admitted_at TIMESTAMP, patient_id INT NOT NULL, status VARCHAR(40), PRIMARY KEY (id), CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE);

--create table treatments
CREATE TABLE treatments (id INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1), type VARCHAR(40), name VARCHAR(40), PRIMARY KEY (id));

--create invoices table
CREATE TABLE invoices (id INT GENERATED ALWAYS AS IDENTITY, total_amount decimal (10, 2), generated_at TIMESTAMP, payed_at TIMESTAMP, medical_history_id INT, PRIMARY KEY (id), CONSTRAINT fk_medical_history FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id));

--create invoice_items
CREATE TABLE invoice_items ( id INT GENERATED ALWAYS AS IDENTITY, unit_price DECIMAL(10,2), quantity INT, total_price DECIMAL(10,2), invoice_id INT, treatment_id INT, PRIMARY KEY(id), CONSTRAINT fk_invoice_id FOREIGN KEY (invoice_id) REFERENCES invoices(id), CONSTRAINT fk_treatment_id FOREIGN KEY(treatment_id) REFERENCES treatments(id));

--create joining table between treatments & medical histories
CREATE TABLE treatment_histories (treatment_id INT, medical_history_id INT, CONSTRAINT fk_treatment_id FOREIGN KEY (treatment_id) REFERENCES treatments(id), CONSTRAINT fk_medical_history FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id));

--createing indexex
CREATE INDEX index_patient_id ON medical_histories(patient_id);
CREATE INDEX index_medical_history_id ON invoices(medical_history_id);
CREATE INDEX index_invoice_id ON invoice_items(invoice_id);
CREATE INDEX index_treatment_id ON invoice_items(treatment_id);
CREATE INDEX indx_treatment_id ON treatment_histories(treatment_id);
CREATE INDEX indx_medical_history_id ON treatment_histories(medical_history_id);
