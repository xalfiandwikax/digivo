const { getDB } = require('../config/db');

class Webhook {
  static collection() {
    return getDB().collection('webhooks');
  }

  static async create(webhookData) {
    return await this.collection().insertOne(webhookData);
  }

  static async findByUrl(url) {
    return await this.collection().findOne({ url });
  }

  static async findActiveByEvent(event) {
    return await this.collection()
      .find({
        active: true,
        $or: [
          { events: event },
          { events: 'all' }
        ]
      })
      .toArray();
  }
}

module.exports = Webhook;