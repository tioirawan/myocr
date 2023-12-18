import 'package:flutter/material.dart';

import '../../domain/models/cv_data_model.dart';
import '../widgets/custom_scaffold.dart';

class InputCvPage extends StatefulWidget {
  const InputCvPage({super.key});

  @override
  State<InputCvPage> createState() => _InputCVPageState();
}

class _InputCVPageState extends State<InputCvPage> {
  String? selectedWorkExperiences;

  int getBenefitScore(val, List values) {
    if (val == null) {
      return 0;
    }
    return values.indexOf(val) + 1;
  }

  int getCostScore(val, List values) {
    if (val == null) {
      return 0;
    }
    return values.length - values.indexOf(val);
  }

  final List<String> workExperiences = [
    '< 6 bulan',
    '6 bulan - 1  tahun',
    '> 1 tahun'
  ];

  String? selectedSkills;
  final List<String> skills = ['< 3', '3 - 5', '> 5'];

  String? selectedLocation;
  final List<String> locations = ['Luar Malang', 'Dalam Malang'];

  String? selectedOrganizationExperiences;
  final List<String> orgExperiences = ['Tidak Ada', 'Ada'];

  String? selectedAge;
  final List<String> ages = ['< 25 Tahun', '25 - 30', '> 30 Tahun'];

  String? selectedGPA;
  final List<String> gpa = ['< 3.0', '>= 3.0'];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final CvDataModel? cvData =
        ModalRoute.of(context)!.settings.arguments as CvDataModel?;

    if (cvData != null) {
      selectedWorkExperiences = workExperiences[cvData.workExperience! - 1];
      selectedSkills = skills[cvData.skills! - 1];
      selectedLocation = locations[cvData.location!];
      selectedOrganizationExperiences = orgExperiences[cvData.organization!];
      selectedAge = ages[ages.length - cvData.age!];
      selectedGPA = gpa[cvData.gpa!];
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppBar(
            centerTitle: true,
            scrolledUnderElevation: 0,
            title: Text(
              'Data CV',
              style: TextStyle(
                color: colorScheme.onBackground,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: colorScheme.onBackground,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            toolbarHeight: 60.0,
          ),
          const Divider(
            // Tambahkan Divider di sini
            height: 1,
            thickness: 1,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pengalaman Kerja',
                      style: textTheme.labelLarge!.apply(fontWeightDelta: 2),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DropdownButtonFormField<String>(
                    value: selectedWorkExperiences,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFE2E2E5).withOpacity(0.4),
                        hintText: 'Pilih Pengalaman Kerja',
                        hintStyle: textTheme.bodySmall,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .primary, // Warna outline saat difokuskan
                            width: 2.0, // Lebar outline saat difokuskan
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none)),
                    items: workExperiences.map((String workExperiences) {
                      return DropdownMenuItem<String>(
                        value: workExperiences,
                        child:
                            Text(workExperiences, style: textTheme.bodyMedium),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedWorkExperiences = newValue;
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Skills',
                      style: textTheme.labelLarge!.apply(fontWeightDelta: 2),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DropdownButtonFormField<String>(
                    value: selectedSkills,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFE2E2E5).withOpacity(0.4),
                      hintText: 'Pilih Skills',
                      hintStyle: textTheme.bodySmall,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    items: skills.map((String skill) {
                      return DropdownMenuItem<String>(
                        value: skill,
                        child: Text(skill, style: textTheme.bodyMedium),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedSkills = newValue;
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Lokasi',
                      style: textTheme.labelLarge!.apply(fontWeightDelta: 2),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: locations.map((String location) {
                      return Row(
                        children: [
                          Radio(
                            value: location,
                            groupValue: selectedLocation,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  selectedLocation = newValue;
                                });
                              }
                            },
                          ),
                          Text(location),
                          const SizedBox(width: 16), // Jarak antar radio button
                        ],
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pengalaman Organisasi',
                      style: textTheme.labelLarge!.apply(fontWeightDelta: 2),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: orgExperiences.map((String orgExperiences) {
                      return Row(
                        children: [
                          Radio(
                            value: orgExperiences,
                            groupValue: selectedOrganizationExperiences,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  selectedOrganizationExperiences = newValue;
                                });
                              }
                            },
                          ),
                          Text(orgExperiences),
                          const SizedBox(width: 16), // Jarak antar radio button
                        ],
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Usia',
                      style: textTheme.labelLarge!.apply(fontWeightDelta: 2),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DropdownButtonFormField<String>(
                    value: selectedAge,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFE2E2E5).withOpacity(0.4),
                        hintText: 'Pilih Usia',
                        hintStyle: textTheme.bodySmall,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .primary, // Warna outline saat difokuskan
                            width: 2.0, // Lebar outline saat difokuskan
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none)),
                    items: ages.map((String ages) {
                      return DropdownMenuItem<String>(
                        value: ages,
                        child: Text(ages, style: textTheme.bodyMedium),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedAge = newValue;
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'IPK',
                      style: textTheme.labelLarge!.apply(fontWeightDelta: 2),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DropdownButtonFormField<String>(
                    value: selectedGPA,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFE2E2E5).withOpacity(0.4),
                        hintText: 'Pilih IPK',
                        hintStyle: textTheme.bodySmall,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .primary, // Warna outline saat difokuskan
                            width: 2.0, // Lebar outline saat difokuskan
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none)),
                    items: gpa.map((String gpa) {
                      return DropdownMenuItem<String>(
                        value: gpa,
                        child: Text(gpa, style: textTheme.bodyMedium),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedGPA = newValue;
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: _onSave,
                    child: Text(
                      'Simpan',
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                            fontWeightDelta: 2,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onSave() async {
    final cvData = CvDataModel(
      workExperience: getBenefitScore(selectedWorkExperiences, workExperiences),
      skills: getBenefitScore(selectedSkills, skills),
      location: getBenefitScore(selectedLocation, locations) - 1,
      organization:
          getBenefitScore(selectedOrganizationExperiences, orgExperiences) - 1,
      age: getCostScore(selectedAge, ages),
      gpa: getBenefitScore(selectedGPA, gpa) - 1,
    );

    Navigator.pop(context, cvData);
  }
}
