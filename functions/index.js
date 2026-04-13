const {onCall, HttpsError} = require("firebase-functions/v2/https");
const {setGlobalOptions} = require("firebase-functions/v2");
const admin = require("firebase-admin");
const cloudinary = require("cloudinary").v2;

admin.initializeApp();
setGlobalOptions({maxInstances: 10});

cloudinary.config({
  cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET,
});

exports.getCloudinarySignature = onCall(async (request) => {
  // Only allow logged-in users
  if (!request.auth) {
    throw new HttpsError("unauthenticated", "You must be logged in.");
  }

  const uid = request.auth.uid;
  const timestamp = Math.round(Date.now() / 1000);

  const paramsToSign = {
    timestamp,
    public_id: `profile_pictures/${uid}`,
    overwrite: true,
  };

  const signature = cloudinary.utils.api_sign_request(
      paramsToSign,
      process.env.CLOUDINARY_API_SECRET,
  );

  return {
    signature,
    timestamp,
    public_id: `profile_pictures/${uid}`,
    api_key: process.env.CLOUDINARY_API_KEY,
    cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
  };
});
