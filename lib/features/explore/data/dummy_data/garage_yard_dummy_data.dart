import 'package:open_house/shared/domain/models/attachment_file/attachment_model.dart';
import 'package:open_house/shared/domain/models/open_house/open_house_model.dart';
import 'package:open_house/shared/domain/models/propert_size_model/propert_size_model.dart';
import 'package:open_house/shared/domain/models/property_type_model/property_type_model.dart';

class GarageYardDummyData {
  static List<OpenHouse> getDummyGarageYards() {
    return [
      OpenHouse(
        id: 1,
        title: 'Modern Garage in Downtown',
        description: 'Spacious garage with security system and 24/7 access',
        price: 250000,
        status: StatusEnum.active,

        propertyModel: PropertSizeModel(
          bedrooms: 0,
          bathrooms: 1,
          coveredArea: 500.0,
          lotSize: 600.0,
        ),
        furnishingStatus: FurnishingEnum.fullyFurnished,

        yearBuilt: DateTime(2020, 1, 1),

        isPetFriendly: true,
        distanceFromLocation: 2.5,
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
        attachments: [
          AttachmentModel(
            id: 1,
            file:
                'https://images.pexels.com/photos/1082355/pexels-photo-1082355.jpeg',
          ),
          AttachmentModel(
            id: 2,
            file:
                'https://images.pexels.com/photos/1082355/pexels-photo-1082355.jpeg',
          ),
          AttachmentModel(
            id: 3,
            file:
                'https://images.pexels.com/photos/1082355/pexels-photo-1082355.jpeg',
          ),
        ],
        availableTimeSlots: [
          AvailableTimeSlot(
            id: 1,
            date: DateTime.now().add(const Duration(days: 1)),
            startTime: '09:00:00',
            endTime: '17:00:00',
            garageYardId: 1,
            isEditable: true,
          ),
          AvailableTimeSlot(
            id: 2,
            date: DateTime.now().add(const Duration(days: 2)),
            startTime: '10:00:00',
            endTime: '18:00:00',
            garageYardId: 1,
            isEditable: true,
          ),
        ],
      ),
      OpenHouse(
        id: 2,
        title: 'Industrial Yard Space',
        description: 'Large yard space suitable for industrial use',
        price: 500000,
        status: StatusEnum.active,
        propertyModel: PropertSizeModel(
          bedrooms: 0,
          bathrooms: 2,
          coveredArea: 2000.0,
          lotSize: 3000.0,
        ),

        yearBuilt: DateTime(2015, 1, 1),

        isPetFriendly: false,
        distanceFromLocation: 5.0,
        location: LocationModel(
          latitude: 27.6788,
          longitude: 85.3447,
          locality: 'Kathmandu',
          adminArea: 'Bagmati Province',
          zipCode: '44600',
          throughfare: 'Industrial Area Rd',
        ),
        attachments: [
          AttachmentModel(
            id: 1,
            file:
                'https://images.pexels.com/photos/1082355/pexels-photo-1082355.jpeg',
          ),
          AttachmentModel(
            id: 2,
            file:
                'https://images.pexels.com/photos/1082355/pexels-photo-1082355.jpeg',
          ),
        ],
        availableTimeSlots: [
          AvailableTimeSlot(
            id: 1,
            date: DateTime.now().add(const Duration(days: 3)),
            startTime: '08:00:00',
            endTime: '16:00:00',
            garageYardId: 2,
            isEditable: true,
          ),
        ],
      ),
      OpenHouse(
        id: 3,
        title: 'Commercial Garage Complex',
        description: 'Multiple garage spaces for commercial use',
        price: 750000,
        status: StatusEnum.active,
        propertyModel: PropertSizeModel(
          bedrooms: 0,
          bathrooms: 3,
          coveredArea: 1500.0,
          lotSize: 2000.0,
        ),
        propertyType: PropertyTypeModel(id: 1, name: 'Garage'),

        yearBuilt: DateTime(2018, 1, 1),

        isPetFriendly: true,
        distanceFromLocation: 3.2,
        location: LocationModel(
          latitude: 27.6688,
          longitude: 85.3347,
          locality: 'Bhaktapur',
          adminArea: 'Bagmati Province',
          zipCode: '44800',
          throughfare: 'Commercial Complex Rd',
        ),
        attachments: [
          AttachmentModel(
            id: 1,
            file:
                'https://images.pexels.com/photos/1082355/pexels-photo-1082355.jpeg',
          ),
          AttachmentModel(
            id: 2,
            file:
                'https://images.pexels.com/photos/1082355/pexels-photo-1082355.jpeg',
          ),
          AttachmentModel(
            id: 3,
            file:
                'https://images.pexels.com/photos/1082355/pexels-photo-1082355.jpeg',
          ),
        ],
        availableTimeSlots: [
          AvailableTimeSlot(
            id: 1,
            date: DateTime.now().add(const Duration(days: 4)),
            startTime: '09:00:00',
            endTime: '17:00:00',
            garageYardId: 3,
            isEditable: true,
          ),
          AvailableTimeSlot(
            id: 2,
            date: DateTime.now().add(const Duration(days: 5)),
            startTime: '10:00:00',
            endTime: '18:00:00',
            garageYardId: 3,
            isEditable: true,
          ),
        ],
      ),
    ];
  }
}
