import 'package:open_house/shared/domain/models/open_house/open_house.dart';

class GarageYardDummyData {
  static List<OpenHouse> getDummyGarageYards() {
    return [
      OpenHouse(
        propertyId: '1',
        transactionId: 'TRX001',
        location: LocationModel(
          latitude: 27.6588,
          longitude: 85.3247,
          subLocality: 'Suite 101',
          locality: 'Lalitpur',
          adminArea: 'Bagmati Province',
          zipCode: '44700',
          subThoroughfare: '1234',
          throughfare: 'Jhamsikhel Rd',
        ),
        propertySize: PropertySize(
          coveredArea: 500.0,
          lotSize: 600.0,
          bedrooms: '0',
          bathrooms: '1',
          yearBuilt: DateTime(2020, 1, 1),
          availableTimeSlots: [
            AvailableTimeSlot(
              id: 1,
              date: DateTime.now().add(const Duration(days: 1)),
              startTime: '09:00:00',
              endTime: '17:00:00',
              isEditable: true,
            ),
            AvailableTimeSlot(
              id: 2,
              date: DateTime.now().add(const Duration(days: 2)),
              startTime: '10:00:00',
              endTime: '18:00:00',
              isEditable: true,
            ),
          ],
        ),
      ),
      OpenHouse(
        propertyId: '2',
        transactionId: 'TRX002',
        location: LocationModel(
          latitude: 27.6788,
          longitude: 85.3447,
          locality: 'Kathmandu',
          adminArea: 'Bagmati Province',
          zipCode: '44600',
          throughfare: 'Industrial Area Rd',
        ),
        propertySize: PropertySize(
          coveredArea: 2000.0,
          lotSize: 3000.0,
          bedrooms: '0',
          bathrooms: '2',
          yearBuilt: DateTime(2015, 1, 1),
          availableTimeSlots: [
            AvailableTimeSlot(
              id: 1,
              date: DateTime.now().add(const Duration(days: 3)),
              startTime: '08:00:00',
              endTime: '16:00:00',
              isEditable: true,
            ),
          ],
        ),
      ),
      OpenHouse(
        propertyId: '3',
        transactionId: 'TRX003',
        location: LocationModel(
          latitude: 27.6688,
          longitude: 85.3347,
          locality: 'Bhaktapur',
          adminArea: 'Bagmati Province',
          zipCode: '44800',
          throughfare: 'Commercial Complex Rd',
        ),
        propertySize: PropertySize(
          coveredArea: 1500.0,
          lotSize: 2000.0,
          bedrooms: '0',
          bathrooms: '3',
          yearBuilt: DateTime(2018, 1, 1),
          availableTimeSlots: [
            AvailableTimeSlot(
              id: 1,
              date: DateTime.now().add(const Duration(days: 4)),
              startTime: '09:00:00',
              endTime: '17:00:00',
              isEditable: true,
            ),
            AvailableTimeSlot(
              id: 2,
              date: DateTime.now().add(const Duration(days: 5)),
              startTime: '10:00:00',
              endTime: '18:00:00',
              isEditable: true,
            ),
          ],
        ),
      ),
    ];
  }
}
