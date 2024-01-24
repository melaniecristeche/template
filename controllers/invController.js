const invModel = require("../models/inventory-model")
const utilities = require("../utilities/")

const invCont = {}

/* ***************************
 *  Build inventory by classification view
 * ************************** */
invCont.buildByClassificationId = async function (req, res, next) {
  const classification_id = req.params.classificationId
  const data = await invModel.getInventoryByClassificationId(classification_id)
  const grid = await utilities.buildClassificationGrid(data)
  let nav = await utilities.getNav()
  const className = data[0].classification_name
  res.render("./inventory/classification", {
    title: className + " vehicles",
    nav,
    grid,
  })
}

module.exports = invCont

// // assignment week 3 Updatte Controller to Use Model and Send Data to View

// const inventoryController = {
//   getInventoryItem: async (req, res) => {
//     try {
//       const itemId = req.params.id;
//       const itemData = await inventoryModel.getInventoryItem(itemId);

//       if (!itemData) {
//         return res.status(404).send('Item not found');
//       }

//       const htmlContent = utilities.wrapDataInHTML(itemData);
//       res.render('inventory/detail', { htmlContent });
//     } catch (error) {
//       console.error(error);
//       res.status(500).send('Internal Server Error');
//     }
//   },
// };

// module.exports = inventoryController;