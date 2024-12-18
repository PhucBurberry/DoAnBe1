<?php
include 'header.php' ?>
<!-- BREADCRUMB -->

<!-- /BREADCRUMB -->

<!-- SECTION -->
<div id="breadcrumb" class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<div class="col-md-12">
				<ul class="breadcrumb-tree">
					<li><a href="#">Home</a></li>
					<li><a href="#">All Categories</a></li>
					<li><a href="#">Accessories</a></li>
					<li class="active">Headphones (227,490 Results)</li>
				</ul>
			</div>
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<!-- ASIDE -->
			<div id="aside" class="col-md-3">
				<!-- aside Widget -->

				<div class="aside">
					<h3 class="aside-title">Categories</h3>
					<div class="checkbox-filter">
						<?php foreach ($getAllProtypes as $value):
						?>
							<div class="input-checkbox">

								<input type="checkbox" id="category-1">
								<label for="category-1">
									<span></span>
									<?php echo $value["type_name"] ?>
									<small>(120)</small>
								</label>
							</div>

						<?php endforeach; ?>
					</div>
				</div>
				<!-- /aside Widget -->


				<!-- aside Widget -->
				<div class="aside">
					<h3 class="aside-title">Price</h3>
					<div class="price-filter">
						<div id="price-slider"></div>
						<div class="input-number price-min">
							<input id="price-min" type="number">
							<span class="qty-up">+</span>
							<span class="qty-down">-</span>
						</div>
						<span>-</span>
						<div class="input-number price-max">
							<input id="price-max" type="number">
							<span class="qty-up">+</span>
							<span class="qty-down">-</span>
						</div>
					</div>
				</div>
				<!-- /aside Widget -->

				<!-- aside Widget -->
				<div class="aside">
					<h3 class="aside-title">Brand</h3>
					<div class="checkbox-filter">
						<?php foreach ($getAllManus as $value):
						?>
							<div class="input-checkbox">
								<input type="checkbox" id="brand-1">
								<label for="brand-1">
									<span></span>
									<?php echo $value["manu_name"] ?>
									<small>(578)</small>
								</label>
							</div>
						<?php endforeach; ?>
					</div>

				</div>
				<!-- /aside Widget -->

				<!-- aside Widget -->
				<div class="aside">
					<h3 class="aside-title">Top selling</h3>

					<?php foreach ($getTopSellingProducttt as $value): ?>
						<div class="product-widget">
							<div class="product-img">
								<img src="./images/<?php echo $value["image"] ?>" alt="">
							</div>
							<div class="product-body">
								<p class="product-category"></p>
								<h3 class="product-name"><a href="#"><?php echo $value["name"] ?></a></h3>
								<h4 class="product-price"><?php echo number_format($value["price"]) ?></h4>
							</div>
						</div>
					<?php endforeach; ?>


				</div>
				<!-- /aside Widget -->
			</div>
			<!-- /ASIDE -->

			<div id="store" class="col-md-9">
				<!-- store top filter -->
				<div class="store-filter clearfix">
					<div class="store-sort">
						<label>
							Sort By:
							<select class="input-select">
								<option value="0">Popular</option>
								<option value="1">Position</option>
							</select>
						</label>

						<label>
							Show:
							<select class="input-select">
								<option value="0">5</option>
								<option value="1">10</option>
							</select>
						</label>
					</div>
					<ul class="store-grid">
						<li class="active"><i class="fa fa-th"></i></li>
						<li><a href="#"><i class="fa fa-th-list"></i></a></li>
					</ul>
				</div>
				<!-- /store top filter -->

				<!-- store products -->
				<div class="row">
					<?php if (isset($_SESSION['wishlist'])) :
						foreach ($_SESSION['wishlist'] as $key1 => $value1) :
							$getProductById1 = $product->getProductById1($key1);
							foreach ($getProductById1 as $p1):
					?>


								<!-- product -->
								<div class="col-md-4 col-xs-6" style="margin-bottom:50px">
									<div class="product">
										<div class="product-img">
											<img src="./images/<?php echo $p1['image'] ?>" alt="" style="width:250px; height:150px;">
											<div class="product-label">

												<span class="new">NEW</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category"><?php echo $p1['type_name'] ?></p>
											<h3 class="product-name"><a
													href="<?php echo 'product.php?id=' . $p1['id'] ?>"><?php echo substr($p1['name'], 0, 23) ?></a>
											</h3>
											<h4 class="product-price">
												<?php echo  number_format($p1['price'] - $p1['price'] / 100) . " ₫";  ?>
												<br> <del
													class="product-old-price"><?php echo number_format($p1['price']) . " ₫";  ?></del>
											</h4>
											<div class="product-rating">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
											</div>
											<div class="product-btns">
												<button class="add-to-wishlist"><a href="deletewl.php?id=<?php echo $p1["id"]; ?>"><i class="fa fa-heart-o" style="color: red"></i><span class="tooltipp"> Remove
															wishlist</span></a></button>
												<button class="add-to-compare"><i class="fa fa-exchange"></i><span
														class="tooltipp">add to compare</span></button>
												<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick
														view</span></button>
											</div>
										</div>


									</div>
								</div>
								<!-- /product -->
					<?php endforeach;
						endforeach;
					endif; ?>
					<div class="clearfix visible-lg visible-md visible-sm visible-xs"></div>

				</div>
				<!-- /store products -->

				<!-- store bottom filter -->
				<
					<!-- /store bottom filter -->
			</div>
			<!-- /STORE -->

		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->

<?php include 'footer.php' ?>