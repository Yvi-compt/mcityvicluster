/*resource "azurerm_resource_group" "yvirg" {
  for_each = var.kubernetes_clusters

  name     = "${each.key}-yvirg"
  location = each.value.location
}
resource "azurerm_kubernetes_cluster" "aks" {
  for_each = var.kubernetes_clusters

  name                = each.key
  location            = each.value.location
  resource_group_name = azurerm_resource_group.yvirg[each.key].name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }
}
resource "azurerm_kubernetes_cluster_node_pool" "node_pools" {
  for_each = { for cluster_name, cluster in var.kubernetes_clusters : 
               cluster_name => cluster.node_pools }

  name                  = each.key
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks[each.key].id
  vm_size               = each.value.vm_size
  node_count            = each.value.node_count
  mode                  = each.value.mode
}
*/
