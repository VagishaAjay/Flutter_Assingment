import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'BLOOD DONOR REGISTRATION',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                _buildTextField('Email ID'),
                SizedBox(height: 16),
                _buildTextField('Name of the Donor'),
                SizedBox(height: 16),
                _buildTextField('USN'),
                SizedBox(height: 16),
                _buildTextField('Donor Age'),
                SizedBox(height: 16),
                _buildDropdown('Donor Gender', ['Male', 'Female', 'Non Binary']),
                SizedBox(height: 16),
                _buildDropdown('Donor Blood Group', [
                  'A RhD positive (A+)',
                  'A RhD negative (A-)',
                  'B RhD positive (B+)',
                  'B RhD negative (B-)',
                  'O RhD positive (O+)',
                  'O RhD negative (O-)',
                  'AB RhD positive (AB+)',
                  'AB RhD negative (AB-)'
                ]),
                SizedBox(height: 16),
                _buildTextField('Donor Mobile Number'),
                SizedBox(height: 16),
                _buildTextField('Donor Additional Mobile Number'),
                SizedBox(height: 16),
                _buildTextField('Address Pin Code'),
                SizedBox(height: 16),
                _buildDropdown('Have you donated Platelets?', ['Yes', 'No']),
                SizedBox(height: 16),
                _buildTextField('Number of Donations'),
                SizedBox(height: 16),
                _buildDateField(context, 'Last Date of Donation'),
                SizedBox(height: 16),
                _buildDropdown('Are you under any medical condition?', ['Yes', 'No']),
                SizedBox(height: 16),
                _buildDropdown('Drinking and Smoking?', ['Yes', 'No']),
                SizedBox(height: 16),
                _buildDropdown('Will you donate blood if you stay close to needy?', ['Yes', 'No']),
                SizedBox(height: 16),
                _buildTextField('Write a few lines about your blood donation experience'),
                SizedBox(height: 16),
                _buildFileUpload('Upload Blood Donation Photo (for activity points)'),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle registration logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Button color
                    foregroundColor: Colors.red, // Text color
                  ),
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          items: options.map((option) {
            return DropdownMenuItem(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildDateField(BuildContext context, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: label,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null) {
              // Handle date selection
            }
          },
        ),
      ],
    );
  }

  Widget _buildFileUpload(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () {
            // Handle file upload logic here
          },
          icon: Icon(Icons.upload_file),
          label: Text('Upload File'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // Button color
            foregroundColor: Colors.red, // Text color
          ),
        ),
      ],
    );
  }
}